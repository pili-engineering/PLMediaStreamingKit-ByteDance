// Copyright (C) 2019 Beijing Bytedance Network Technology Co., Ltd.

#import <UIKit/UIKit.h>
@class BEButtonItemModel, BEModernFilterPickerView;

@protocol BEModernFilterPickerViewDelegate <NSObject>
@required
- (void)filterPicker:(BEModernFilterPickerView *)pickerView didSelectedFilter:(BEButtonItemModel *)filter;

@end

@interface BEModernFilterPickerView : UIView

@property (nonatomic, copy, readonly) NSArray <BEButtonItemModel *> *filters;
@property (nonatomic, weak) id<BEModernFilterPickerViewDelegate> delegate;

- (void)refreshWithFilters:(NSArray <BEButtonItemModel *> *)filters;
- (void)setAllCellsUnSelected;
- (void)setSelectItem:(int)indexPath;

@end
