// Copyright (C) 2019 Beijing Bytedance Network Technology Co., Ltd.

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BEEffectPanelTabType) {
    BEEffectPanelTabBeautyFace,
    BEEffectPanelTabBeautyReshape,
    BEEffectPanelTabBeautyBody,
    BEEffectPanelTabFilter,
    BEEffectPanelTabMakeup
};

NS_ASSUME_NONNULL_BEGIN

@interface BEEffectCategoryModel : NSObject

@property (nonatomic, readonly) BEEffectPanelTabType type;
@property (nonatomic, readonly, copy) NSString *title;

+ (instancetype)categoryWithType:(BEEffectPanelTabType)type title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
