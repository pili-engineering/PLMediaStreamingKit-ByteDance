//
//  BEButtonItemModel.m
//  BytedEffects
//
//  Created by QunZhang on 2019/8/19.
//  Copyright © 2019 ailab. All rights reserved.
//

#import "BEButtonItemModel.h"

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

@interface BEButtonItemModel () {
    NSMutableArray *_children;
}

@end

@implementation BEButtonItemModel

+ (instancetype)beautyModelWithInternalKey:(NSString *)internalKey {
    if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_SMOOTH]) {
        return [BEButtonItemModel
                initWithType: PLSMakeUpComponentTypeBeauty
                selectImg:@"iconFaceBeautySkinSelected.png"
                unselectImg:@"iconFaceBeautySkinNormal.png"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_WHITEN]) {
        return [BEButtonItemModel
                initWithType: PLSMakeUpComponentTypeBeauty
                selectImg:@"iconFaceBeautyWhiteningSelected.png"
                unselectImg:@"iconFaceBeautyWhiteningNormal.png"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_SHARPE]) {
        return [BEButtonItemModel
                initWithType: PLSMakeUpComponentTypeBeauty
                selectImg:@"iconFaceBeautySharpSelected.png"
                unselectImg:@"iconFaceBeautySharpNormal.png"
                title:@""];
    }
    NSAssert(NO, @"undefined key!!");
    return [self initWithType:PLSMakeUpComponentTypeBeauty selectImg:nil unselectImg:nil title:nil];
}

+ (instancetype)makeupModelWithType:(PLSMakeUpType)type {
    if (type == PLSMakeUpTypeBlush) {
        return [BEButtonItemModel
                initWithType: type
                selectImg:@"iconFaceMakeUpBlusherSelected.png"
                unselectImg:@"iconFaceMakeUpBlusherNormal.png"
                title:@""];
    } else if (type == PLSMakeUpTypeLip) {
        return [BEButtonItemModel
                initWithType: type
                selectImg:@"iconFaceMakeUpLipsSelected.png"
                unselectImg:@"iconFaceMakeUpLipsNormal.png"
                title:@""];
    } else if (type == PLSMakeUpTypeFacial) {
        return [BEButtonItemModel
                initWithType: type
                selectImg:@"iconFaceMakeUpFacialSelected.png"
                unselectImg:@"iconFaceMakeUpFacialNormal.png"
                title:@""];
    } else if (type == PLSMakeUpTypePupil) {
        return [BEButtonItemModel
                initWithType: type
                selectImg:@"iconFaceMakeUpPupilSelected.png"
                unselectImg:@"iconFaceMakeUpPupilNormal.png"
                title:@""];
    } else if (type == PLSMakeUpTypeHair) {
        return [BEButtonItemModel
                initWithType: type
                selectImg:@"iconHairSelected.png"
                unselectImg:@"iconHairNormal.png"
                title:@""];
    } else if (type == PLSMakeUpTypeEyeshadow) {
        return [BEButtonItemModel
                initWithType: type
                selectImg:@"iconFaceMakeUpEyeshadowSelected.png"
                unselectImg:@"iconFaceMakeUpEyeshadowNormal.png"
                title:@""];
    } else if (type == PLSMakeUpTypeEyebrow) {
        return [BEButtonItemModel
                initWithType: type
                selectImg:@"iconFaceMakeUpEyebrowSelected.png"
                unselectImg:@"iconFaceMakeUpEyebrowNormal.png"
                title:@""];
    }

    NSAssert(NO, @"undefined type!!");
    return [self initWithType:PLSMakeUpTypeUndefined selectImg:nil unselectImg:nil title:nil];
}

+ (instancetype)reshapeModelWithInternalKey:(NSString *)internalKey {
    if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_FACEOVERALL]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconFaceBeautyLiftingSelected.png"
                unselectImg:@"iconFaceBeautyLiftingNormal.png"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_FACECUT]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeFaceCutSelect"
                unselectImg:@"iconBeautyReshapeFaceCutNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_FACESMALL]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeFaceSmallSelect"
                unselectImg:@"iconBeautyReshapeFaceSmallNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_EYE]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconFaceBeautyBigEyeSelected.png"
                unselectImg:@"iconFaceBeautyBigEyeNormal.png"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_EYEROTATE]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeEyeRotateSelect"
                unselectImg:@"iconBeautyReshapeEyeRotateNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_CHEEK]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeCheekSelect"
                unselectImg:@"iconBeautyReshapeCheekNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_JAW]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeJawSelect"
                unselectImg:@"iconBeautyReshapeJawNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_NOSELEAN]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeNoseLeanSelect"
                unselectImg:@"iconBeautyReshapeNoseLeanNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_NOSELONG]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeNoseLongSelect"
                unselectImg:@"iconBeautyReshapeNoseLongNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_CHIN]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeChinSelect"
                unselectImg:@"iconBeautyReshapeChinNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_FOREHEAD]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeForeheadSelect"
                unselectImg:@"iconBeautyReshapeForeheadNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_MOUTHZOOM]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeMouthZoomSelect"
                unselectImg:@"iconBeautyReshapeMouthZoomNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_MOUTHSMILE]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeMouthSmileSelect"
                unselectImg:@"iconBeautyReshapeMouthSmileNormal"
                title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_EYEMOVE]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeEyeRotateSelect"
                unselectImg:@"iconBeautyReshapeEyeRotateNormal"
                title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_EYESPACING]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeEyeRotateSelect"
                unselectImg:@"iconBeautyReshapeEyeRotateNormal"
                title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_MOVMOUTH]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpComponentTypeReshape
                selectImg:@"iconBeautyReshapeMouthZoomSelect"
                unselectImg:@"iconBeautyReshapeMouthZoomNormal"
                title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_BRIGHTEN_EYE]) {
    return [BEButtonItemModel
            initWithType: PLSMakeUpComponentTypeReshape
            selectImg:@"iconFaceBeautySkinSelected.png"
            unselectImg:@"iconFaceBeautySkinNormal.png"
            title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_WHITEN_TEETH]) {
    return [BEButtonItemModel
            initWithType: PLSMakeUpComponentTypeReshape
            selectImg:@"iconFaceBeautySharpSelected.png"
            unselectImg:@"iconFaceBeautySharpNormal.png"
            title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_REMOVE_POUCH]) {
    return [BEButtonItemModel
            initWithType: PLSMakeUpComponentTypeReshape
            selectImg:@"iconFaceBeautySkinSelected.png"
            unselectImg:@"iconFaceBeautySkinNormal.png"
            title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_SMILES_FOLDS]) {
    return [BEButtonItemModel
            initWithType: PLSMakeUpComponentTypeReshape
            selectImg:@"iconFaceBeautySharpSelected.png"
            unselectImg:@"iconFaceBeautySharpNormal.png"
            title:@""];
    }
    
    NSAssert(NO, @"undefined key!!");
    return [self initWithType:PLSMakeUpComponentTypeReshape selectImg:nil unselectImg:nil title:nil];
}

+ (instancetype)bodyModelWithInternalKey:(NSString *)internalKey {
    if ([internalKey isEqualToString:@"BEF_BEAUTY_BODY_LONG_LEG"]) {
        return [BEButtonItemModel
         initWithType:PLSMakeUpComponentTypeBody
         selectImg:@"iconBeautyBodyLegLongSelect"
         unselectImg:@"iconBeautyBodyLegLongNormal"
         title:@""];
    } else if ([internalKey isEqualToString:@"BEF_BEAUTY_BODY_THIN"]) {
        return [BEButtonItemModel
         initWithType:PLSMakeUpComponentTypeBody
         selectImg:@"iconBeautyBodyThinSelect"
         unselectImg:@"iconBeautyBodyThinNormal"
         title:@""];
    }
    
    NSAssert(NO, @"undefined type!!");
    return [self initWithType:PLSMakeUpComponentTypeBody selectImg:nil unselectImg:nil title:nil];
}

+ (instancetype)clearModel {
    return [BEButtonItemModel
            initWithType:PLSMakeUpTypeUndefined
            selectImg:@"iconCloseButtonSelected.png"
            unselectImg:@"iconCloseButtonNormal.png"
            title:@"关闭"];
}

+ (instancetype)initWithType:(PLSMakeUpComponentType)type selectImg:(NSString *)selectImg unselectImg:(NSString *)unselectImg title:(NSString *)title {
    BEButtonItemModel *model = [[self alloc] initWithSelectImg:selectImg unselectImg:unselectImg title:title];
    model.type = type;
    return model;
}

- (instancetype)initWithSelectImg:(NSString *)selectImg unselectImg:(NSString *)unselectImg title:(NSString *)title{
    if (self = [self init]) {
        self.selectImg = selectImg;
        self.unselectImg = unselectImg;
        self.title = title;
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        _children = [NSMutableArray new];
        self.level = 0;
        self.selectedIndex = 0;
        self.intensity = 0;
    }
    return self;
}

- (void)addChild:(BEButtonItemModel *)child {
    [_children addObject:child];
    child.parent = self;
    child.level = _level + 1;
}

- (void)removeChild:(BEButtonItemModel *)child {
    [_children removeObject:child];
    child.parent = nil;
}

- (NSArray<BEButtonItemModel *> *)children {
    return _children;
}

@end
