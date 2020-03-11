//
//  BEButtonItemModel.m
//  BytedEffects
//
//  Created by QunZhang on 2019/8/19.
//  Copyright © 2019 ailab. All rights reserved.
//

#import "BEButtonItemModel.h"

@interface BEButtonItemModel () {
    NSMutableArray *_children;
}

@end

@implementation BEButtonItemModel

+ (instancetype)beautyModelWithInternalKey:(NSString *)internalKey {
    if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_SMOOTH]) {
        return [BEButtonItemModel
                initWithType: PLSMakeUpTypeBeauty
                selectImg:@"iconFaceBeautySkinSelected.png"
                unselectImg:@"iconFaceBeautySkinNormal.png"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_WHITEN]) {
        return [BEButtonItemModel
                initWithType: PLSMakeUpTypeBeauty
                selectImg:@"iconFaceBeautyWhiteningSelected.png"
                unselectImg:@"iconFaceBeautyWhiteningNormal.png"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_SHARPE]) {
        return [BEButtonItemModel
                initWithType: PLSMakeUpTypeBeauty
                selectImg:@"iconFaceBeautySharpSelected.png"
                unselectImg:@"iconFaceBeautySharpNormal.png"
                title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_BRIGHTEN_EYE]) {
    return [BEButtonItemModel
            initWithType: PLSMakeUpTypeBeauty
            selectImg:@"iconFaceBeautySkinSelected.png"
            unselectImg:@"iconFaceBeautySkinNormal.png"
            title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_WHITEN_TEETH]) {
    return [BEButtonItemModel
            initWithType: PLSMakeUpTypeBeauty
            selectImg:@"iconFaceBeautySharpSelected.png"
            unselectImg:@"iconFaceBeautySharpNormal.png"
            title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_REMOVE_POUCH]) {
    return [BEButtonItemModel
            initWithType: PLSMakeUpTypeBeauty
            selectImg:@"iconFaceBeautySkinSelected.png"
            unselectImg:@"iconFaceBeautySkinNormal.png"
            title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_SMILES_FOLDS]) {
    return [BEButtonItemModel
            initWithType: PLSMakeUpTypeBeauty
            selectImg:@"iconFaceBeautySharpSelected.png"
            unselectImg:@"iconFaceBeautySharpNormal.png"
            title:@""];
    }
    NSAssert(NO, @"undefined key!!");
    return [self initWithType:PLSMakeUpTypeBeauty selectImg:nil unselectImg:nil title:nil];
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
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconFaceBeautyLiftingSelected.png"
                unselectImg:@"iconFaceBeautyLiftingNormal.png"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_FACECUT]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeFaceCutSelect"
                unselectImg:@"iconBeautyReshapeFaceCutNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_FACESMALL]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeFaceSmallSelect"
                unselectImg:@"iconBeautyReshapeFaceSmallNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_EYE]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconFaceBeautyBigEyeSelected.png"
                unselectImg:@"iconFaceBeautyBigEyeNormal.png"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_EYEROTATE]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeEyeRotateSelect"
                unselectImg:@"iconBeautyReshapeEyeRotateNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_CHEEK]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeCheekSelect"
                unselectImg:@"iconBeautyReshapeCheekNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_JAW]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeJawSelect"
                unselectImg:@"iconBeautyReshapeJawNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_NOSELEAN]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeNoseLeanSelect"
                unselectImg:@"iconBeautyReshapeNoseLeanNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_NOSELONG]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeNoseLongSelect"
                unselectImg:@"iconBeautyReshapeNoseLongNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_CHIN]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeChinSelect"
                unselectImg:@"iconBeautyReshapeChinNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_FOREHEAD]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeForeheadSelect"
                unselectImg:@"iconBeautyReshapeForeheadNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_MOUTHZOOM]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeMouthZoomSelect"
                unselectImg:@"iconBeautyReshapeMouthZoomNormal"
                title:@""];
    } else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_MOUTHSMILE]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeMouthSmileSelect"
                unselectImg:@"iconBeautyReshapeMouthSmileNormal"
                title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_EYEMOVE]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeEyeRotateSelect"
                unselectImg:@"iconBeautyReshapeEyeRotateNormal"
                title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_EYESPACING]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeEyeRotateSelect"
                unselectImg:@"iconBeautyReshapeEyeRotateNormal"
                title:@""];
    }else if ([internalKey isEqualToString:PLS_EFFECT_INTERNALKEY_MOVMOUTH]) {
        return [BEButtonItemModel
                initWithType:PLSMakeUpTypeReshape
                selectImg:@"iconBeautyReshapeMouthZoomSelect"
                unselectImg:@"iconBeautyReshapeMouthZoomNormal"
                title:@""];
    }
    
    NSAssert(NO, @"undefined key!!");
    return [self initWithType:PLSMakeUpTypeReshape selectImg:nil unselectImg:nil title:nil];
}

+ (instancetype)bodyModelWithPath:(NSString *)path {
    NSString *name = [path componentsSeparatedByString:@"/"].lastObject;
    if ([name isEqualToString:@"longleg"]) {
        [BEButtonItemModel
         initWithType:PLSMakeUpTypeBody
         selectImg:@"iconBeautyBodyThinSelect"
         unselectImg:@"iconBeautyBodyThinNormal"
         title:@""];
    } else if ([name isEqualToString:@"thin"]) {
        [BEButtonItemModel
         initWithType:PLSMakeUpTypeBody
         selectImg:@"iconBeautyBodyThinSelect"
         unselectImg:@"iconBeautyBodyThinNormal"
         title:@""];
    }
    
    NSAssert(NO, @"undefined type!!");
    return [self initWithType:PLSMakeUpTypeBody selectImg:nil unselectImg:nil title:nil];
}

+ (instancetype)clearModel {
    return [BEButtonItemModel
            initWithType:PLSMakeUpTypeUndefined
            selectImg:@"iconCloseButtonSelected.png"
            unselectImg:@"iconCloseButtonNormal.png"
            title:@"关闭"];
}

+ (instancetype)initWithType:(PLSMakeUpType)type selectImg:(NSString *)selectImg unselectImg:(NSString *)unselectImg title:(NSString *)title {
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
