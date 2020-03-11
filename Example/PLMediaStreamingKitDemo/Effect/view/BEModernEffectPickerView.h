// Copyright (C) 2019 Beijing Bytedance Network Technology Co., Ltd.

#import <UIKit/UIKit.h>
#import <PLSEffect/PLSEffect.h>


NS_ASSUME_NONNULL_BEGIN


@interface BEModernEffectPickerView : UIView

@property (nonatomic, weak) PLSEffectManager *effectManager;
@property (nonatomic, weak) PLSEffectDataManager *dataManager;

- (void)loadData;
- (void)updateSelectedEffect;

@end

NS_ASSUME_NONNULL_END
