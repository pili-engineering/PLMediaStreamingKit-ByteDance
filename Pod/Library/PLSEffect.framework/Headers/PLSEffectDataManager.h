//
//  PLSEffectDataManager.h
//  PLShortVideoKit
//
//  Created by 李政勇 on 2019/12/16.
//  Copyright © 2019 Pili Engineering, Qiniu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString * const PLS_EFFECT_INTERNALKEY_SHARPE = @"sharp";                                   //锐化
static NSString * const PLS_EFFECT_INTERNALKEY_SMOOTH = @"smooth";                                  //磨皮
static NSString * const PLS_EFFECT_INTERNALKEY_WHITEN = @"whiten";                                  //美白
static NSString * const PLS_EFFECT_INTERNALKEY_BRIGHTEN_EYE = @"BEF_BEAUTY_BRIGHTEN_EYE";                      //亮眼
static NSString * const PLS_EFFECT_INTERNALKEY_WHITEN_TEETH = @"BEF_BEAUTY_WHITEN_TEETH";              //白牙
static NSString * const PLS_EFFECT_INTERNALKEY_REMOVE_POUCH = @"BEF_BEAUTY_REMOVE_POUCH";            //黑眼圈
static NSString * const PLS_EFFECT_INTERNALKEY_SMILES_FOLDS = @"BEF_BEAUTY_SMILES_FOLDS";         //法令纹

static NSString * const PLS_EFFECT_INTERNALKEY_FACEOVERALL = @"Internal_Deform_Overall";            //瘦脸
static NSString * const PLS_EFFECT_INTERNALKEY_FACECUT = @"Internal_Deform_CutFace";                //窄脸
static NSString * const PLS_EFFECT_INTERNALKEY_FACESMALL = @"Internal_Deform_Face";                 //小脸
static NSString * const PLS_EFFECT_INTERNALKEY_EYE = @"Internal_Deform_Eye";                        //大眼
static NSString * const PLS_EFFECT_INTERNALKEY_EYEROTATE = @"Internal_Deform_RotateEye";            //眼角度
static NSString * const PLS_EFFECT_INTERNALKEY_CHEEK = @"Internal_Deform_Zoom_Cheekbone";           //瘦颧骨
static NSString * const PLS_EFFECT_INTERNALKEY_JAW = @"Internal_Deform_Zoom_Jawbone";               //下颌骨
static NSString * const PLS_EFFECT_INTERNALKEY_NOSELEAN = @"Internal_Deform_Nose";                  //痩鼻
static NSString * const PLS_EFFECT_INTERNALKEY_NOSELONG = @"Internal_Deform_MovNose";               //长鼻
static NSString * const PLS_EFFECT_INTERNALKEY_CHIN = @"Internal_Deform_Chin";                      //下巴
static NSString * const PLS_EFFECT_INTERNALKEY_FOREHEAD = @"Internal_Deform_Forehead";              //额头
static NSString * const PLS_EFFECT_INTERNALKEY_MOUTHZOOM = @"Internal_Deform_ZoomMouth";            //嘴型
static NSString * const PLS_EFFECT_INTERNALKEY_MOUTHSMILE = @"Internal_Deform_MouthCorner";         //微笑
static NSString * const PLS_EFFECT_INTERNALKEY_EYEMOVE = @"Internal_Deform_Eye_Move";                      //眼移动
static NSString * const PLS_EFFECT_INTERNALKEY_EYESPACING = @"Internal_Eye_Spacing";              //眼距
static NSString * const PLS_EFFECT_INTERNALKEY_MOVMOUTH = @"Internal_Deform_MovMouth";            //缩人中

static NSString * const PLS_EFFECT_INTERNALKEY_LIP = @"Internal_Makeup_Lips";                       //口红
static NSString * const PLS_EFFECT_INTERNALKEY_BLUSHER = @"Internal_Makeup_Blusher";                //腮红
static NSString * const PLS_EFFECT_INTERNALKEY_FACIAL = @"Internal_Makeup_Facial";                  //修容
static NSString * const PLS_EFFECT_INTERNALKEY_PUPIL = @"Internal_Makeup_Pupil";                    //美瞳
static NSString * const PLS_EFFECT_INTERNALKEY_HAIR = @"";                                          //染发
static NSString * const PLS_EFFECT_INTERNALKEY_EYESHADOW = @"Internal_Makeup_Eye";                  //眼影
static NSString * const PLS_EFFECT_INTERNALKEY_EYEBROW = @"Internal_Makeup_Brow";                   //眉毛

/*!
 @typedef PLSEffectType:
 @abstract   特效类型
 
 @since      v1.0.0
 */
typedef NS_ENUM(NSInteger, PLSEffectType) {
    PLSEffectTypeUndefined,
    
    PLSEffectTypeFilter,
    PLSEffectTypeSticker
};

/*!
 @typedef PLSMakeUpType:
 @abstract   美妆类型
 
 @since      v1.0.0
 */
typedef NS_ENUM(NSInteger, PLSMakeUpType) {
    PLSMakeUpTypeUndefined,
    
    PLSMakeUpTypeBeauty,        //美颜
    PLSMakeUpTypeReshape,       //美型
    PLSMakeUpTypeBody,          //美体
    
    PLSMakeUpTypeLip,           //口红
    PLSMakeUpTypeBlush,         //腮红
    PLSMakeUpTypeFacial,        //修容
    PLSMakeUpTypePupil,         //美瞳
    PLSMakeUpTypeHair,          //染发
    PLSMakeUpTypeEyeshadow,     //眼影
    PLSMakeUpTypeEyebrow,       //眉毛
    
    PLSMakeUpTypeEnd
};

@class PLSEffectModel, PLSMakeUpComponentModel;

/*!
 @class PLSEffectDataManager
 @abstract 管理特效资源文件的类
 
 @discussion 若使用默认的资源文件层级结构，可使用此类获取各种效果的列表。
 */
@interface PLSEffectDataManager : NSObject

/*!
 @property rootPath
 @brief 资源文件根目录
 
 @since      v1.0.0
 */
@property (nonatomic, copy, readonly) NSString *rootPath;

- (instancetype)init NS_UNAVAILABLE;

/*!
 @method initWithRootPath:
 @abstract   初始化
 
 @param root 资源文件的根目录
 
 @since      v1.0.0
 */
- (instancetype)initWithRootPath:(NSString *)root NS_DESIGNATED_INITIALIZER;

/*!
 @method fetchEffectListWithType:
 @abstract   获取贴纸、滤镜列表
 
 @param type 类型
 
 @since      v1.0.0
 */
- (NSArray<PLSEffectModel *> *)fetchEffectListWithType:(PLSEffectType)type;

/*!
 @method fetchMakeUpComponentsWithType:
 @abstract   获取makeup列表
 
 @param type 类型
 
 @since      v1.0.0
 */
- (NSArray<PLSMakeUpComponentModel *> *)fetchMakeUpComponentsWithType:(PLSMakeUpType)type;

@end

NS_ASSUME_NONNULL_END
