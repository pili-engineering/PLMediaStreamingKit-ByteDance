### 生成列表

生成列表需要Python环境，并安装[pypinyin](https://github.com/mozillazg/python-pinyin)库

#### 1.获取资源文件

假设资源文件路径：~/Download/Resource

文件结构如下：

``` JavaScript
Resource/
├── ComposeMakeup.bundle
│   └── ComposeMakeup
│       ├── beauty_Android
│       ├── beauty_IOS
│       ├── composer
│       └── reshape
├── FilterResource.bundle
│   └── Filter
│       ├── Filter_01_38
│       ├── Filter_02_14
│       └── ......
├── LicenseBag.bundle
│   ├── qiniu_20200214_20210213_com.qbox.PLShortVideoKit.ByteDance.Demo_qiniu_v3.4.2.licbag
│   └── qiniu_20200214_20210213_com.qiniu.pili.droid.shortvideo.bytedance.demo_qiniu_v3.4.2.licbag
├── ModelResource.bundle
│   ├── handmodel
│   │   ├── tt_hand_box_reg_v8.0.model
│   │   ├── tt_hand_det_v7.0.model
│   │   ├── tt_hand_gesture_v8.0.model
│   │   ├── tt_hand_kp_v5.0.model
│   │   └── tt_hand_seg_v1.0.model
│   ├── ttfaceattrmodel
│   │   ├── tt_beauty_attr6_v1.0.model
│   │   └── tt_face_attribute_v4.1.model
│   └── ttfacemodel
│       ├── tt_face_extra_v9.0.model
│       └── tt_face_v6.0.model
└── StickerResource.bundle
    └── stickers
        ├── biaobaiqixi
        ├── gongzhumianju
        ├── haoqilongbao
        ├── haqi
        └── ......
```

icon资源如下：

```
Document/resource/七牛icon/
├── 侏罗纪冒险（摇头变身不同恐龙）
│   └── a8d71761a0da812ebb731c34623151e7.png
├── ......
└── 黑猫眼镜
    └── 12765bb97f141945901289f8171ceb3c.png
```

#### 2.运行脚本

切换到脚本所在目录

```
cd Document/resource
```

将icon资源文件夹拷贝到此目录，并将文件夹更名为"七牛icon"

运行脚本

```
python3 listGenerator.py
```
或
```
python2 listGenerator_py2.py
```

脚本提示：

input resource root dir:

根据提示输入资源文件的根目录

~/Download/Resource

然后回车，脚本会扫描资源文件生成对应的list.json文件，若资源文件中存在名称与icon中的名称不匹配的文件时将会提示

unprocessed xxx：xxx

需要手动将资源添加到list.json中

### 注意

> 微整形的列表无法通过扫描资源文件生成，需要拷贝makeup_list_sample.json至~/Resource/ComposeMakeup.bundle/ComposeMakeup文件夹下，更名为list_ios.json，并手动删除不支持的功能。