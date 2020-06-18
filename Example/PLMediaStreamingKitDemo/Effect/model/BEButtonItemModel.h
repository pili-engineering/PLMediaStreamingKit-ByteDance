//
//  BEButtonItemModel.h
//  BytedEffects
//
//  Created by QunZhang on 2019/8/19.
//  Copyright © 2019 ailab. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BEButtonViewCell.h"
#import <PLSEffect/PLSEffect.h>

#define BEColorWithRGBHex(hex) [UIColor colorWithRed:((hex&0xFF0000)>>16)/255.0 green:((hex&0x00FF00)>>8)/255.0 blue:((hex&0x0000FF))/255.0 alpha:1]

@class BEButtonViewCell;
@interface BEButtonItemModel : NSObject

+ (instancetype)initWithType:(PLSMakeUpType)type selectImg:(NSString *)selectImg unselectImg:(NSString *)unselectImg title:(NSString *)title;

+ (instancetype)beautyModelWithInternalKey:(NSString *)internalKey;
+ (instancetype)reshapeModelWithInternalKey:(NSString *)internalKey;
+ (instancetype)makeupModelWithType:(PLSMakeUpType)type;
+ (instancetype)bodyModelWithInternalKey:(NSString *)internalKey;

+ (instancetype)clearModel;

@property (nonatomic, assign) PLSMakeUpComponentType type;
@property (nonatomic, strong) NSString *selectImg;
@property (nonatomic, strong) NSString *unselectImg;
@property (nonatomic, strong) NSString *title;

@property (nonatomic, assign) int selectedIndex;
@property (nonatomic, assign) CGFloat intensity;

@property (nonatomic, strong) id relatedModel;

@property (nonatomic, assign) int level;
@property (nonatomic, strong, readonly) NSArray<BEButtonItemModel *> *children;
@property (nonatomic, strong) BEButtonItemModel *parent;

- (void)addChild:(BEButtonItemModel *)child;
- (void)removeChild:(BEButtonItemModel *)child;

@end
