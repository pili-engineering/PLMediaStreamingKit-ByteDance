// Copyright (C) 2019 Beijing Bytedance Network Technology Co., Ltd.
#import <UIKit/UIKit.h> 

NS_ASSUME_NONNULL_BEGIN

@interface BEEffectTitleCollectionViewCell : UICollectionViewCell

- (void)renderWithTitle:(NSString *)title;
- (void)setTitleLabelFont:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
