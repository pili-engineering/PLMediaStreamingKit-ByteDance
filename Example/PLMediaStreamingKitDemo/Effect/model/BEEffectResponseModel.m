// Copyright (C) 2019 Beijing Bytedance Network Technology Co., Ltd.

#import "BEEffectResponseModel.h"

@implementation  BEEffectCategoryModel

+ (instancetype)categoryWithType:(BEEffectPanelTabType)type title:(NSString *)title {
    return [[self alloc] initWithType:type title:title];
}

- (instancetype)initWithType:(BEEffectPanelTabType)type title:(NSString *)title {
    if (self = [super init]) {
        _type = type;
        _title = title;
    }
    return self;
}

@end
