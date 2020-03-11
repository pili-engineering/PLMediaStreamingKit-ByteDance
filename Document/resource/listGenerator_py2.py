# -*- coding: utf-8 -*-
# !usr/bin/python2

# 需要安装 https://github.com/mozillazg/python-pinyin

from pypinyin import pinyin, Style
import os
import json
import re
import shutil
from typing import Dict


print("input resource root dir:")
resource_dir = raw_input()
icon_root_dir = "./七牛icon"
filter_icon_dir = "./images"

prog = re.compile(u'^([^\s（）]*)\s*（?([^（）]*)）?$')
sticker_info = {}
dispaly_name_key = "displayName"
tip_key = "tip"
icon_path_key = "icon_path"

makeupDir = "ComposeMakeup.bundle/ComposeMakeup"
stickerDir = "StickerResource.bundle/stickers"
filterDir = "FilterResource.bundle/Filter"
filter_infos = {
  "Filter_47_S5" : {
    "path" : "Filter_47_S5",
    "icon_name" : "iconFilterlandiaojiaopian",
    "displayName" : "蓝调胶片",
    "intensity" : 1
  },
  "Filter_08_17" : {
    "path" : "Filter_08_17",
    "icon_name" : "iconFilterpaomo",
    "displayName" : "泡沫",
    "intensity" : 1
  },
  "Filter_41_F4" : {
    "path" : "Filter_41_F4",
    "icon_name" : "iconFiltershise",
    "displayName" : "食色",
    "intensity" : 1
  },
  "Filter_17_04" : {
    "path" : "Filter_17_04",
    "icon_name" : "iconFilternuanyang",
    "displayName" : "暖阳",
    "intensity" : 1
  },
  "Filter_23_Po1" : {
    "path" : "Filter_23_Po1",
    "icon_name" : "iconFilterwenrou",
    "displayName" : "温柔",
    "intensity" : 1
  },
  "Filter_45_S3" : {
    "path" : "Filter_45_S3",
    "icon_name" : "iconFilterlutu",
    "displayName" : "旅途",
    "intensity" : 1
  },
  "Filter_27_Po5" : {
    "path" : "Filter_27_Po5",
    "icon_name" : "iconFilternaicha",
    "displayName" : "奶茶",
    "intensity" : 1
  },
  "Filter_09_19" : {
    "path" : "Filter_09_19",
    "icon_name" : "iconFilteryinghua",
    "displayName" : "樱花",
    "intensity" : 1
  },
  "Filter_37_L5" : {
    "path" : "Filter_37_L5",
    "icon_name" : "iconFilterqingtou",
    "displayName" : "清透",
    "intensity" : 1
  },
  "Filter_38_F1" : {
    "path" : "Filter_38_F1",
    "icon_name" : "iconFilterziran2",
    "displayName" : "自然2",
    "intensity" : 1
  },
  "Filter_11_09" : {
    "path" : "Filter_11_09",
    "icon_name" : "iconFilterwuyu",
    "displayName" : "物语",
    "intensity" : 1
  },
  "Filter_43_S1" : {
    "path" : "Filter_43_S1",
    "icon_name" : "iconFiltermeishijiaopian",
    "displayName" : "美式胶片",
    "intensity" : 1
  },
  "Filter_12_08" : {
    "path" : "Filter_12_08",
    "icon_name" : "iconFilterbeihaidao",
    "displayName" : "北海道",
    "intensity" : 1
  },
  "Filter_35_L3" : {
    "path" : "Filter_35_L3",
    "icon_name" : "iconFilteryese",
    "displayName" : "夜色",
    "intensity" : 1
  },
  "Filter_26_Po4" : {
    "path" : "Filter_26_Po4",
    "icon_name" : "iconFilterandiao",
    "displayName" : "暗调",
    "intensity" : 1
  },
  "Filter_03_20" : {
    "path" : "Filter_03_20",
    "icon_name" : "iconFilteryangqi",
    "displayName" : "氧气",
    "intensity" : 1
  },
  "Filter_33_L1" : {
    "path" : "Filter_33_L1",
    "icon_name" : "iconFilterhaidao",
    "displayName" : "海岛",
    "intensity" : 1
  },
  "Filter_31_Po9" : {
    "path" : "Filter_31_Po9",
    "icon_name" : "iconFilterhaibianrenxiang",
    "displayName" : "海边人像",
    "intensity" : 1
  },
  "Filter_21_01" : {
    "path" : "Filter_21_01",
    "icon_name" : "iconFiltertuise",
    "displayName" : "褪色",
    "intensity" : 1
  },
  "Filter_42_F5" : {
    "path" : "Filter_42_F5",
    "icon_name" : "iconFilterchuanwei",
    "displayName" : "川味",
    "intensity" : 1
  },
  "Filter_02_14" : {
    "path" : "Filter_02_14",
    "icon_name" : "iconFilternaiyou",
    "displayName" : "奶油",
    "intensity" : 1
  },
  "Filter_46_S4" : {
    "path" : "Filter_46_S4",
    "icon_name" : "iconFilternuanhuang",
    "displayName" : "暖黄",
    "intensity" : 1
  },
  "Filter_20_05" : {
    "path" : "Filter_20_05",
    "icon_name" : "iconFilterjulandiao",
    "displayName" : "橘蓝调",
    "intensity" : 1
  },
  "Filter_04_12" : {
    "path" : "Filter_04_12",
    "icon_name" : "iconFilterjugeng",
    "displayName" : "桔梗",
    "intensity" : 1
  },
  "Filter_01_38" : {
    "path" : "Filter_01_38",
    "icon_name" : "iconFilterroubai",
    "displayName" : "柔白",
    "intensity" : 1
  },
  "Filter_14_15" : {
    "path" : "Filter_14_15",
    "icon_name" : "iconFilterxiyatu",
    "displayName" : "西雅图",
    "intensity" : 1
  },
  "Filter_25_Po3" : {
    "path" : "Filter_25_Po3",
    "icon_name" : "iconFilterchujian",
    "displayName" : "初见",
    "intensity" : 1
  },
  "Filter_07_06" : {
    "path" : "Filter_07_06",
    "icon_name" : "iconFiltermakalong",
    "displayName" : "马卡龙",
    "intensity" : 1
  },
  "Filter_18_18" : {
    "path" : "Filter_18_18",
    "icon_name" : "iconFilterjiuri",
    "displayName" : "旧日",
    "intensity" : 1
  },
  "Filter_19_37" : {
    "path" : "Filter_19_37",
    "icon_name" : "iconFilterhongchun",
    "displayName" : "红唇",
    "intensity" : 1
  },
  "Filter_16_13" : {
    "path" : "Filter_16_13",
    "icon_name" : "iconFilterjiaopian",
    "displayName" : "胶片",
    "intensity" : 1
  },
  "Filter_29_Po7" : {
    "path" : "Filter_29_Po7",
    "icon_name" : "iconFilterxiyang",
    "displayName" : "夕阳",
    "intensity" : 1
  },
  "Filter_22_16" : {
    "path" : "Filter_22_16",
    "icon_name" : "iconFilterheibai",
    "displayName" : "黑白",
    "intensity" : 1
  },
  "Filter_30_Po8" : {
    "path" : "Filter_30_Po8",
    "icon_name" : "iconFilterlengyang",
    "displayName" : "冷氧",
    "intensity" : 1
  },
  "Filter_15_07" : {
    "path" : "Filter_15_07",
    "icon_name" : "iconFilterjingmi",
    "displayName" : "静谧",
    "intensity" : 1
  },
  "Filter_32_Po10" : {
    "path" : "Filter_32_Po10",
    "icon_name" : "iconFiltergaojihui",
    "displayName" : "高级灰",
    "intensity" : 1
  },
  "Filter_06_03" : {
    "path" : "Filter_06_03",
    "icon_name" : "iconFiltermitao",
    "displayName" : "蜜桃",
    "intensity" : 1
  },
  "Filter_13_02" : {
    "path" : "Filter_13_02",
    "icon_name" : "iconFilterriza",
    "displayName" : "日杂",
    "intensity" : 1
  },
  "Filter_36_L4" : {
    "path" : "Filter_36_L4",
    "icon_name" : "iconFilterhongzong",
    "displayName" : "红棕",
    "intensity" : 1
  },
  "Filter_39_F2" : {
    "path" : "Filter_39_F2",
    "icon_name" : "iconFiltersuda",
    "displayName" : "苏打",
    "intensity" : 1
  },
  "Filter_40_F3" : {
    "path" : "Filter_40_F3",
    "icon_name" : "iconFilterjiazhou",
    "displayName" : "加州",
    "intensity" : 1
  },
  "Filter_10_11" : {
    "path" : "Filter_10_11",
    "icon_name" : "iconFilterqiannuan",
    "displayName" : "浅暖",
    "intensity" : 1
  },
  "Filter_44_S2" : {
    "path" : "Filter_44_S2",
    "icon_name" : "iconFilterhongsefugu",
    "displayName" : "红色复古",
    "intensity" : 1
  },
  "Filter_24_Po2" : {
    "path" : "Filter_24_Po2",
    "icon_name" : "iconFilterlianaichaotian",
    "displayName" : "恋爱超甜",
    "intensity" : 1
  },
  "Filter_34_L2" : {
    "path" : "Filter_34_L2",
    "icon_name" : "iconFilterqianxia",
    "displayName" : "浅夏",
    "intensity" : 1
  },
  "Filter_28_Po6" : {
    "path" : "Filter_28_Po6",
    "icon_name" : "iconFiltersoft",
    "displayName" : "soft",
    "intensity" : 1
  },
  "Filter_05_10" : {
    "path" : "Filter_05_10",
    "icon_name" : "iconFilterluolita",
    "displayName" : "洛丽塔",
    "intensity" : 1
  }
}
makeupListStr = """
{
    "beauty":[
        {
            "path":"beauty_IOS",
            "displayName":"锐化",
            "internalKey":"sharp",
            "intensity":1.0
        },
        {
            "path":"beauty_IOS",
            "displayName":"磨皮",
            "internalKey":"smooth",
            "intensity":1.0
        },
        {
            "path":"beauty_IOS",
            "displayName":"美白",
            "internalKey":"whiten",
            "intensity":1.0
        }
    ],
    "reshape":[
        {
            "path":"reshape",
            "displayName":"瘦脸",
            "internalKey":"Internal_Deform_Overall",
            "intensity":1.0
        },
        {
            "path":"reshape",
            "displayName":"大眼",
            "internalKey":"Internal_Deform_Eye",
            "intensity":1.0
        }
    ]
}
"""


def get_pinyin(string):
    py_list = pinyin(string, style=Style.NORMAL)
    py_str = ""
    for li in py_list:
        py_str += li[0]
    return py_str


def get_icon_info():
    for icon_dir_name in os.listdir(icon_root_dir):
        icon_dir = os.path.join(icon_root_dir, icon_dir_name)
        if not os.path.isdir(icon_dir):
            continue
        icon_files = os.listdir(icon_dir)
        for icon_file in icon_files:
            if os.path.splitext(icon_file)[-1] == ".png":
                # print(icon_dir_name)
                icon_path = os.path.join(icon_dir, icon_file)
                result = prog.match(icon_dir_name.decode('utf-8'))
                # print(result.groups())
                sticker_name = result.group(1)
                sticker_tip = result.group(2)
                sticker_pinyin = get_pinyin(sticker_name)
                # print(sticker_pinyin)
                sticker_info[sticker_pinyin] = {dispaly_name_key: sticker_name.encode('utf-8'), tip_key: sticker_tip.encode('utf-8'), icon_path_key: icon_path}
                # print(result.groups())
                # print(sticker_pinyin)
                break
    # print(sticker_info)
    return


def gen_sticker_list():
    dirpath = os.path.join(resource_dir, stickerDir)
    if not os.path.exists(dirpath):
        print("sticker directory not exists!!!")
        return
    listpath = os.path.join(dirpath, "list.json")
    if os.path.exists(listpath):
        print("sticker list already exists, replace it?(y/n)")
        conti = raw_input().strip()
        if conti != 'y':
            print("skip sticker")
            return
    print("gen sticker list...")
    json_obj = []
    for sticker in os.listdir(dirpath):
        tmppath = os.path.join(dirpath, sticker)
        if os.path.isdir(tmppath):
            if sticker in sticker_info:
                sticker_dic = sticker_info[sticker]
                icon_path = sticker_dic.pop(icon_path_key)
                sticker_dic["path"] = sticker
                icon_dst_path = os.path.join(tmppath, "icon.png")
                shutil.copy(icon_path, icon_dst_path)
                json_obj.append(sticker_dic)
            else:
                print("unprocessed sticker: {}".format(sticker))
    file_handle = open(listpath, 'w+')
    file_handle.write(json.dumps(json_obj, indent=4, ensure_ascii=False))
    file_handle.close()
    return


def gen_filter_list():
    dirpath = os.path.join(resource_dir, filterDir)
    if not os.path.exists(dirpath):
        print("filter directory not exists!!!")
        return
    listpath = os.path.join(dirpath, "list.json")
    if os.path.exists(listpath):
        print("filter list already exists, replace it?(y/n)")
        conti = raw_input().strip()
        if conti != 'y':
            print("skip filter")
            return
    print("gen filter list...")
    json_obj = []
    for filter in os.listdir(dirpath):
        tmppath = os.path.join(dirpath, filter)
        if os.path.isdir(tmppath):
            if filter in filter_infos:
                filter_dic = filter_infos[filter]
                icon_name = filter_dic.pop("icon_name") + ".png"
                icon_src_path = os.path.join(filter_icon_dir, icon_name)
                icon_dst_path = os.path.join(tmppath, "icon.png")
                json_obj.append(filter_dic)
                shutil.copy(icon_src_path, icon_dst_path)
            else:
                print("unprocessed filter: ", filter)
    file_handle = open(listpath, 'w+')
    file_handle.write(json.dumps(json_obj, indent=4, ensure_ascii=False))
    file_handle.close()
    return


def gen_makeup_list():
    dirpath = os.path.join(resource_dir, makeupDir)
    if not os.path.exists(dirpath):
        print("makeup directory not exists!!!")
        return
    listpath = os.path.join(dirpath, "list_ios.json")
    if os.path.exists(listpath):
        print("makeup list already exists, replace it?(y/n)")
        conti = raw_input().strip()
        if conti != 'y':
            print("skip makeup")
            return
    print("gen makeup list...")
    file_handle = open(listpath, 'w+')
    file_handle.write(makeupListStr)
    file_handle.close()
    return


if not os.path.exists(resource_dir):
    print("resource directory not exists!!!")
elif not os.path.exists(icon_root_dir):
    print("icon information directory not exists!!!")
else:
    get_icon_info()
    gen_sticker_list()
    gen_filter_list()
    gen_makeup_list()