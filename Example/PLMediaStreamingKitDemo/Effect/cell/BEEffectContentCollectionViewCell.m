// Copyright (C) 2019 Beijing Bytedance Network Technology Co., Ltd.

#import "BEEffectContentCollectionViewCell.h"
#import <Masonry/Masonry.h>

@implementation BEEffectContentCollectionViewCellFactory

+ (Class)contentCollectionViewCellWithPanelTabType:(BEEffectPanelTabType)type {
    Class cellClass = [BEEffectContentCollectionViewCell class];
    switch (type) {
        
        case BEEffectPanelTabBeautyFace:
        case BEEffectPanelTabBeautyReshape:
        case BEEffectPanelTabBeautyBody:
        case BEEffectPanelTabMakeup:
            cellClass = [BEEffectFaceBeautyViewCell class];
            break;
        case BEEffectPanelTabFilter:
            cellClass = [BEEffecFiltersCollectionViewCell class];
            break;

    }
    return cellClass;
}

@end


@implementation BEEffectContentCollectionViewCell

- (void)displayContentView:(UIView *)view {
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)hideContentView:(UIView*)view {
    [view removeFromSuperview];
}

- (void)setCellUnSelected{
    return ;
}
@end

#pragma mark - 滤镜cell


@implementation BEEffecFiltersCollectionViewCell

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self displayContentView:self.filterView];
}

- (BEModernFilterPickerView *)filterView {
    if (!_filterView) {
        _filterView = [[BEModernFilterPickerView alloc] initWithFrame:CGRectZero];
    }
    return _filterView;
}

@end

@implementation BEEffectFaceBeautyViewCell

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    
    [self displayContentView:self.beautyView];
}

#pragma mark - getter
- (BEFaceBeautyView *)beautyView {
    if (!_beautyView) {
        _beautyView = [[BEFaceBeautyView alloc] init];
    }
    return _beautyView;
}
@end
