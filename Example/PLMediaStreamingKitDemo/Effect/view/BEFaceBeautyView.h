//
//  BEFaceBeautyView.h
//  BytedEffects
//
//  Created by QunZhang on 2019/8/19.
//  Copyright © 2019 ailab. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BEButtonItemModel.h"

@class BEFaceBeautyView;
@protocol BEFaceBeautyViewDelegate <NSObject>
@required
- (void)beautyView:(BEFaceBeautyView *)view didSelectedItem:(BEButtonItemModel *)item index:(int)idx;
@end

@interface BEFaceBeautyView : UIView

@property (nonatomic, assign) PLSMakeUpType type;
@property (nonatomic, strong) NSArray<BEButtonItemModel *> *items;

- (void)setType:(PLSMakeUpType)type data:(BEButtonItemModel *)data;

@property (nonatomic, weak) id<BEFaceBeautyViewDelegate> delegate;

@end
