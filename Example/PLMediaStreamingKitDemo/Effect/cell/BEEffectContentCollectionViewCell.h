// Copyright (C) 2019 Beijing Bytedance Network Technology Co., Ltd.

#import "BEEffectResponseModel.h"
#import "BEButtonItemModel.h"
#import "BEFaceBeautyView.h"
#import "BEModernFilterPickerView.h"

@class BEEffectContentCollectionViewCell;

NS_ASSUME_NONNULL_BEGIN

@interface BEEffectContentCollectionViewCellFactory : NSObject

+ (Class)contentCollectionViewCellWithPanelTabType:(BEEffectPanelTabType)type;

@end

@interface BEEffectContentCollectionViewCell : UICollectionViewCell
@property (nonatomic, assign) BOOL shouldClearStatus;

-(void)setCellUnSelected;
@end

@interface BEEffecFiltersCollectionViewCell : BEEffectContentCollectionViewCell

@property (nonatomic, strong) BEModernFilterPickerView *filterView;

@end

@interface BEEffectFaceBeautyViewCell : BEEffectContentCollectionViewCell

@property (nonatomic, assign) PLSMakeUpType type;
@property (nonatomic, strong) BEFaceBeautyView *beautyView;

@end

NS_ASSUME_NONNULL_END
