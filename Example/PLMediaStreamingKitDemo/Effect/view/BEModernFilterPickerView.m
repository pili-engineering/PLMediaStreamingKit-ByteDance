// Copyright (C) 2019 Beijing Bytedance Network Technology Co., Ltd.

#import "BEModernFilterPickerView.h"
#import "BEModernFilterCollectionViewCell.h"
#import "BEEffectResponseModel.h"
#import <Masonry/Masonry.h>
#import "BEDeviceInfoHelper.h"
#import "BEButtonItemModel.h"

@interface BEModernFilterPickerView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, weak) NSIndexPath* currentSelectedCellIndexPath;
@end

@implementation BEModernFilterPickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(80);
            make.leading.trailing.equalTo(self);
            if (BEDeviceInfoHelper.isIPhoneXSeries) {
                make.bottom.equalTo(self).with.offset(-20);
            } else {
                make.bottom.equalTo(self).with.offset(-10);
            }
        }];
    }
    return self;
}

#pragma mark - public
- (void)refreshWithFilters:(NSArray<BEButtonItemModel *> *)filters {
    _filters = filters;
    
    [self.collectionView reloadData];
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
}

- (void)setAllCellsUnSelected{
    if (_currentSelectedCellIndexPath){
        [self.collectionView deselectItemAtIndexPath:_currentSelectedCellIndexPath animated:false];
    }
    _currentSelectedCellIndexPath = nil;
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
}

- (void)setSelectItem:(int)indexPath {
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.filters.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BEModernFilterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BEModernFilterCollectionViewCell class]) forIndexPath:indexPath];
    [cell configureWithFilter:self.filters[indexPath.row].relatedModel];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _currentSelectedCellIndexPath = indexPath;
    [_delegate filterPicker:self didSelectedFilter:_filters[indexPath.row]];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(56, 80);
}


#pragma mark - getter && setter

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 21;
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = UIEdgeInsetsMake(5, 20, 5, 20);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[BEModernFilterCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([BEModernFilterCollectionViewCell class])];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}


@end
