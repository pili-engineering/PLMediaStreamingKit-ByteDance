
# 1 概述
PLMediaStreamingKit-ByteDance 是七牛推出的一款适用于 iOS 平台的具有高级特效功能的短视频 SDK，提供了包括高级美颜、高级滤镜、动态贴纸、水印、推流、混音、QUIC等在内的多种功能，支持高度定制以及二次开发。

# 2 阅读对象

本文档为技术文档，需要阅读者：

- 具有基本的 iOS 开发能力
- 准备接入七牛云短视频

# 3 总体设计

本产品由 PLEffect 和 PLMediaStreamingKit 两部分组成，本文档将介绍特效部分的开发接入，PLMediaStreamingKit 开发文档请参考**[PLMediaStreamingKit 文档](https://developer.qiniu.com/pili/sdk/3733/short-video-ios-sdk)**


## 3.1 基本规则

为了方便理解和使用，对于 SDK 的接口设计，我们遵循了如下的原则：

- 每一个接口类，均以 `PL` 开头
- 简单的配置，通过 `NSDictionary` 来设置
- 复杂的配置类，以 `PLXXXConfiguration` 命名
- 所有的回调代理，以 `PLXXXXDelegate` 命名


## 3.2 核心接口

核心的接口类说明如下：

| 接口类名                 | 功能        | 备注              |
| ----------------------- | --------- | --------------- |
| PLSEffectDataManager    | 负责资源文件的管理   | 若使用默认文件层级结构可使用此接口快速获取列表。若有更多需求（比如文件下发），用户也可自行管理文件结构 |
| PLSEffectManager   	   | 负责特效的管理 | 美颜、滤镜、贴纸等配置切换   |


# 4 快速开始

## 4.1 设备以及系统要求

- 设备要求：iPhone 5 及以上
- 系统要求：iOS 8 及以上

## 4.2 开发环境配置

- Xcode 开发工具。App Store [下载地址](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12)
- 安装 CocoaPods。[了解 CocoaPods 使用方法](https://cocoapods.org/)

## 4.3 导入 SDK

### Podfile

为了使用 CoacoaPods 集成 PLMediaStreamingKit-ByteDance 到你的 Xcode 工程当中，你需要编写你的 `Podfile`

```ruby
target 'TargetName' do
pod 'PLMediaStreamingKit-ByteDance', :podspec => 'https://raw.githubusercontent.com/pili-engineering/PLMediaStreamingKit-ByteDance/master/PLMediaStreamingKit-ByteDance.podspec'
end
```

然后，运行如下的命令：

```bash
$ pod install
```

## 4.4 添加权限说明
我们需要在 Info.plist 文件中添加相应权限的说明，否则程序在 iOS 10 系统上会出现崩溃。需要添加如下权限：

- 麦克风权限：Privacy - Microphone Usage Description 是否允许 App 使用麦克风
- 相机权限： Privacy - Camera Usage Description 是否允许 App 使用相机
- 相册权限： Privacy - Photo Library Usage Description 是否允许 App 访问媒体资料库


## 4.5 导入资源文件
解压资源文件，得到如下目录结构

```
├── ComposeMakeup.bundle 		//美颜美妆素材
│   └── ComposeMakeup
│       ├── beauty_IOS
│       ├── composer
│       ├── list_ios.json 		 //列表文件，PLSEffectDataManager 将根据此文件生成美颜美妆列表，可自行编辑
│       ├── list_sample.json  	//列表文件示例
│       └── reshape
├── FilterResource.bundle
│   └── Filter
│       ├──***
│       └── list.json  	//列表文件，PLSEffectDataManager 将根据此文件生成滤镜列表，可自行编辑
├── LicenseBag.bundle  	//授权文件
│   └── ***.licbag
├── ModelResource.bundle   	//算法模型文件
│   ├── ttfaceattrmodel
│   │   ├── tt_beauty_attr6_v1.0.model
│   │   └── tt_face_attribute_v4.1.model
│   └── ttfacemodel
│       ├── tt_face_extra_v9.0.model
│       └── tt_face_v6.0.model
└── StickerResource.bundle 		//贴纸素材
    └── stickers
        ├── ***
        └── list.json  		 //列表文件，PLSEffectDataManager 将根据此文件生成贴纸列表，可自行编辑
```

## 4.6 使用方法
初始化 PLSEffectMananger

```
//资源文件根目录，这里是 MainBundle
NSString *rootPath = [[NSBundle mainBundle] resourcePath];
PLSEffectConfiguration *effectConfiguration = [PLSEffectConfiguration new];
effectConfiguration.modelFileDirPath = [NSString pathWithComponents:@[rootPath, @"ModelResource.bundle"]];
effectConfiguration.licenseFilePath = [NSString pathWithComponents:@[rootPath, @"LicenseBag.bundle", @"(你自己的授权文件名).licbag"]];
    
//初始化 datamanager
_effectDataManager = [[PLSEffectDataManager alloc] initWithRootPath:rootPath];
    
//初始化 effecManager
_effectManager = [PLSEffectManager sharedWith:[[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2] configuration:effectConfiguration];
```

设置需要显示的效果

```
//更新贴纸
[_effectManager updateSticker: selectedSticker];
//更新滤镜
[_effectManager updateFilter:_selectedFilter];
[_effectManager updateFilterIntensity:1.0];
//更新美颜美型
[_effectManager updateMakeupComponents:components];
for (PLSMakeUpComponentModel *model in components) {
    [_effectManager updateMakeupComponentIntensity:1.0withComponent:model];
}
```

传入待处理的 CVPiexelbuffer 或者 texture

```
double timestamp = timingInfo.presentationTimeStamp.value/timingInfo.presentationTimeStamp.timescale;
//相机采集 buffer 的方向和设备方向将用于推测人脸的方向，传入不正确可能导致人脸识别失败
[self.effectManager processBuffer:pixelBuffer withTimestamp:timestamp videoOrientation:self.shortVideoRecorder.videoOrientation deviceOrientation:self.deviceOrientation];
```

# 5. FAQ

### 5.1 如何获取此 SDK 授权 ？

答：可通过 400-808-9176 转 2 号线联系七牛商务咨询，或者 [通过工单](https://support.qiniu.com/?ref=developer.qiniu.com) 联系七牛的技术支持。

### 5.2 是否支持更多的动态贴纸、滤镜效果 ？

答：支持，用户可以额外购买动态贴纸、滤镜等素材，可在特效君 APP 上进行选择，联系七牛商务进行购买。

### 5.3 素材是否通用？
答：不通用，素材与包名绑定，不同包名不可以混用素材

### 5.4 正式授权到期必需替换新授权发布新版本强制用户更新吗？
答：正式授权到期需替换新授权文件，但不一定需要发布新版本，建议可以通过类似文件下发服务的方式将新授权文件下发下去。

### 5.5 授权失败可能的原因有哪些？
答：请先检查是否为下面的原因  
1.检查手机系统时间是否正常  
2.检查项目 Bundle ID 是否与授权的 Bundle ID 一致   
3.检查是否传入了正确的授权文件路径

如确定不是以上问题，请[通过工单](https://support.qiniu.com/?ref=developer.qiniu.com) 联系七牛的技术支持。

