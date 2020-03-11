//
//  BEFaceBeautyView.m
//  BytedEffects
//
//  Created by QunZhang on 2019/8/19.
//  Copyright © 2019 ailab. All rights reserved.
//

#import <Masonry.h>

#import "BEFaceBeautyView.h"
#import "BEButtonViewCell.h"

@interface BEFaceBeautyView () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource> {
    NSInteger _selectItem;
}
@property (nonatomic, strong) UICollectionView *cv;
@property (nonatomic, strong) BEButtonItemModel *data;
@end


@implementation BEFaceBeautyView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.type = PLSMakeUpTypeUndefined;
        [self addSubview:self.cv];
        [self.cv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

#pragma mark - public
- (void)setType:(PLSMakeUpType)type data:(BEButtonItemModel *)data {
    self.type = type;
    self.data = data;
    _selectItem = data.selectedIndex;
    self.items = data.children;
    [self.cv reloadData];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_selectItem == indexPath.row) {
        return;
    }
    
    [[self.cv cellForItemAtIndexPath:[NSIndexPath indexPathForRow:_selectItem inSection:0]] setSelected:NO];
    _selectItem = indexPath.row;
    [self.delegate beautyView:self didSelectedItem:_items[indexPath.row] index:(int)_selectItem];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(70, 65);
}

#pragma mark - UICollectionViewDataSource
-(NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    [collectionView.collectionViewLayout invalidateLayout];
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BEButtonViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BEButtonViewCell class]) forIndexPath:indexPath];
    BEButtonItemModel *item = self.items[indexPath.row];
    [cell setSelectImg:[UIImage imageNamed:item.selectImg]
           unselectImg:[UIImage imageNamed:item.unselectImg]
                 title:item.title
                 desc:@""];
    [cell setSelected:(_selectItem == indexPath.row)];
    
    [cell setPointOn:indexPath.row > 0 && _data.selectedIndex == indexPath.row];

    return cell;
}

#pragma mark - getter
- (UICollectionView *)cv {
    if (!_cv) {
        UICollectionViewFlowLayout *fl = [UICollectionViewFlowLayout new];
        fl.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        fl.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        fl.minimumLineSpacing = 10;
        _cv = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:fl];
        [_cv registerClass:[BEButtonViewCell class] forCellWithReuseIdentifier:NSStringFromClass([BEButtonViewCell class])];
        _cv.backgroundColor = [UIColor clearColor];
        _cv.showsHorizontalScrollIndicator = NO;
        _cv.showsVerticalScrollIndicator = NO;
        _cv.allowsMultipleSelection = NO;
        _cv.dataSource = self;
        _cv.delegate = self;
    }
    return _cv;
}

@end
