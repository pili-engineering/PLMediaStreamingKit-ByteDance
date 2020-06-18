//
//  PLSEffectDataManager.h
//  PLShortVideoKit
//
//  Created by 李政勇 on 2019/12/16.
//  Copyright © 2019 Pili Engineering, Qiniu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLETypeDefines.h"

NS_ASSUME_NONNULL_BEGIN


@class PLSEffectModel, PLSMakeUpComponentModel, PLSMakeupModel;

/*!
 @class PLSEffectDataManager
 @abstract 管理特效资源文件的类
 
 @discussion 若使用默认的资源文件层级结构，可使用此类获取各种效果的列表。
 */
@interface PLSEffectDataManager : NSObject

/*!
 @property rootPath
 @brief 资源文件根目录
 
 @since      v1.0.0
 */
@property (nonatomic, copy, readonly) NSString *rootPath;

- (instancetype)init NS_UNAVAILABLE;

/*!
 @method initWithRootPath:
 @abstract   初始化
 
 @param root 资源文件的根目录
 
 @since      v1.0.0
 */
- (instancetype)initWithRootPath:(NSString *)root NS_DESIGNATED_INITIALIZER;

/*!
 @method fetchEffectListWithType:
 @abstract   获取贴纸、滤镜列表
 
 @param type 类型
 
 @since      v1.0.0
 */
- (NSArray<PLSEffectModel *> *)fetchEffectListWithType:(PLSEffectType)type;

/*!
 @method fetchMakeUpComponentsWithType:
 @abstract   获取美型列表
 
 @param type 类型
 
 @since      v1.0.0
 */
- (NSArray<PLSMakeUpComponentModel *> *)fetchMakeUpComponentsWithType:(PLSMakeUpComponentType)type;

/*!
 @method fetchMakeUpWithType:
 @abstract   获取美妆列表
 
 @param type 类型
 
 @since      v2.0.0
 */
- (PLSMakeupModel *)fetchMakeUpWithType:(PLSMakeUpType)type;

@end

NS_ASSUME_NONNULL_END
