# PLMediaStreamingKit-ByteDance

PLMediaStreamingKit-ByteDance 是七牛推出的一款适用于 iOS 平台的具有高级特效功能的推流 SDK，提供了包括高级美颜、高级滤镜、动态贴纸、水印、推流、混音、QUIC等在内的多种功能，支持高度定制以及二次开发。PLMediaStreamingKit 功能请参考[PLMediaStreamingKit](https://github.com/pili-engineering/PLMediaStreamingKit/blob/master/README.md)

Demo下载:

![QRCode](http://pk0jd2tt5.bkt.clouddn.com/PLMediaStreamingKit-ByteDance.png)

## 1 功能介绍

此款 SDK 包含七牛推流中所有功能，并额外提供高级美颜、高级美型、高级滤镜和动态贴纸。具有效果自然、强度可调、配置灵活、适应各种光照场景、GPU 上实时渲染、毫秒级响应等优势，基于领先的人脸关键点检测技术，支持多人脸检测，且贴合各种脸型。
**有关于七牛推流 SDK 的功能请参考[七牛推流介绍文档](https://github.com/pili-engineering/PLMediaStreamingKit/blob/master/README.md)**


<table>
   <tr>
      <td>类别</td>
      <td>功能</td>
      <td>描述</td>
   </tr>
   <tr>
      <td rowspan="7">美颜</td>
      <td>磨皮</td>
      <td>通过调节参数设置磨皮程度。参数值越大磨皮程度越高，皮肤越光滑无暇。</td>
   </tr>
   <tr>
      <td>美白</td>
      <td>通过调节参数设置美白程度。参数值越大美白程度越高，皮肤越白皙通透。</td>
   </tr>
   <tr>
      <td>锐化</td>
      <td>通过参数设置调节锐化程度。锐化程度越高，图像越清晰。</td>
   </tr>
   <tr>
      <td>白牙</td>
      <td>通过调节参数设置牙齿美白程度。参数值越大美白程度越高，牙齿越白皙。</td>
   </tr>
   <tr>
      <td>黑眼圈</td>
      <td>通过调节参数设置消除黑眼圈程度。参数值越大效果越明显。</td>
   </tr>
   <tr>
      <td>法令纹</td>
      <td>通过调节参数设置消除法令纹程度。参数值越大效果越明显。</td>
   </tr>
   <tr>
      <td>亮眼</td>
      <td>通过调节参数设置眼睛明亮程度。参数值越大亮眼程度越高。</td>
   </tr>
   <tr>
      <td rowspan="16">美型</td>
      <td>窄脸</td>
      <td>通过调节参数设置窄脸程度。参数值越大窄脸程度越大。</td>
   </tr>
   <tr>
      <td>瘦脸</td>
      <td>通过调节参数设置瘦脸程度。整体比例协调，效果自然。</td>
   </tr>
   <tr>
      <td>大眼</td>
      <td>通过调节参数设置大眼程度。自然放大，效果真实。</td>
   </tr>
   <tr>
      <td>小脸</td>
      <td>通过调节参数设置小脸程度。参数值越大小脸程度越大。</td>
   </tr>
   <tr>
      <td>瘦颧骨</td>
      <td>通过调节参数实现瘦颧骨效果。参数值越大效果越明显。</td>
   </tr>
   <tr>
      <td>下颌骨</td>
      <td>通过调节参数实现瘦下颌骨效果。参数值越大效果越明显。</td>
   </tr>
   <tr>
      <td>瘦鼻</td>
      <td>通过调节参数实现瘦鼻效果。参数值越大瘦鼻程度越大。</td>
   </tr>
   <tr>
      <td>长鼻</td>
      <td>通过调节参数实现长鼻效果。参数值越大效果越明显。</td>
   </tr>
   <tr>
      <td>下巴</td>
      <td>通过调节参数实现下巴塑形效果。参数值越大效果越明显。</td>
   </tr>
   <tr>
      <td>额头</td>
      <td>通过调节参数实现丰额头效果。参数值越大效果越明显。</td>
   </tr>
   <tr>
      <td>眼角度</td>
      <td>通过调节参数实现眼角度调节。参数越大效果越明显。</td>
   </tr>
   <tr>
      <td>嘴形</td>
      <td>通过调节参数实现调节嘴形效果，参数值越大效果越明显。</td>
   </tr>
   <tr>
      <td>微笑</td>
      <td>通过调节参数实现嘴角上扬效果。参数值越大效果越明显。</td>
   </tr>
   <tr>
      <td>眼移动</td>
      <td>通过调节参数设置眼移动程度。参数值越移动程度越高。</td>
   </tr>
   <tr>
      <td>眼距</td>
      <td>通过调节参数设置眼睛距离。参数值越大调整度越高。</td>
   </tr>
   <tr>
      <td>缩人中</td>
      <td>通过调节参数设置人中缩距。参数值越大缩人中程度越高。</td>
   </tr>
   <tr>
      <td>滤镜</td>
      <td>滤镜</td>
      <td>多款滤镜效果可选，适用多种场景，GPU 上实时渲染，毫秒级让场景美起来。</td>
   </tr>
   <tr>
      <td>动态贴纸</td>
      <td>动态贴纸</td>
      <td>SDK 提供多款基础贴纸，以及多款面部动作触发类和手势识别触发类贴纸，适用多种场景。且基于领先的人脸关键点检测技术，贴纸可精准贴合人脸，并实时跟踪。</td>
   </tr>
   <tr>
      <td rowspan="7">美妆</td>
      <td>口红</td>
      <td>提供包括复古红，少女粉，元气橘，西柚色，西瓜红，丝绒红，脏橘色，梅子色，珊瑚色，豆沙色等几种选项</td>
   </tr>
   <tr>
      <td>腮红</td>
      <td>提供包括微醺，日常，蜜桃，甜橙，俏皮，心机，晒伤等几种选项</td>
   </tr>
   <tr>
      <td>修容</td>
      <td>提供包括01，02，03，04等几种修容选项</td>
   </tr>
   <tr>
      <td>美瞳</td>
      <td>提供包括混血棕，可可棕，蜜桃粉，水光黑，星空蓝，初见灰等几种选项</td>
   </tr>
   <tr>
      <td>染发</td>
      <td>提供包括暗蓝，墨绿，深棕等几种染发选项</td>
   </tr>
   <tr>
      <td>眼影</td>
      <td>提供包括大地棕，晚霞红，少女粉，气质粉，梅子红，焦糖棕，元气橘，奶茶色等几种眼影可选项</td>
   </tr>
   <tr>
      <td>眉毛</td>
      <td>提供包括纯黑、淡灰、自然黑等可选项</td>
   </tr>
</table>



## 2 设备以及系统要求

- 设备要求：搭载 iOS 系统的设备
- 系统要求：iOS 8.0 及其以上

## 3 使用方法

请参考开发者中心文档：[PLMediaStreamingKit-ByteDance](Document/PLMediaStreamingKit-ByteDance.md)

## 4 声明

本特效插件 SDK 需授权方可使用，可通过 400-808-9176 转 2 号线联系七牛商务咨询，或者 [通过工单](https://support.qiniu.com/?ref=developer.qiniu.com) 联系七牛的技术支持。

## 5 反馈及意见

当你遇到任何问题时，可以通过在 GitHub 的 repo 提交 issues 来反馈问题，请尽可能的描述清楚遇到的问题，如果有错误信息也一同附带，并且在 Labels 中指明类型为 bug 或者其他。

[通过这里查看已有的 issues 和提交 Bug](https://github.com/pili-engineering/PLMediaStreamingKit-ByteDance/issues)
~
