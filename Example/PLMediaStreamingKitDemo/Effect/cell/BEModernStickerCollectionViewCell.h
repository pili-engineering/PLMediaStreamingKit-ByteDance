// Copyright (C) 2019 Beijing Bytedance Network Technology Co., Ltd.
#import <UIKit/UIKit.h>

@class PLSEffectModel;

NS_ASSUME_NONNULL_BEGIN

@interface  BEModernStickerCollectionViewCell: UICollectionViewCell

-(void)configureWithSticker:(PLSEffectModel *)sticker;
- (void)configureWithUIImage:(UIImage *)image;
@end
NS_ASSUME_NONNULL_END
