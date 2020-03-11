//
//  PLSEVersionInfo.h
//  PLSEffect
//
//  Created by 李政勇 on 2020/2/10.
//  Copyright © 2020 Hermes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*!
 @class PLSEVersionInfo
 @brief SDK 版本信息获取
 */
@interface PLSEVersionInfo : NSObject

/*!
 @method versionInfo
 @brief 获取 SDK 版本信息，包含主版本号和 git 版本号
 
 @return 返回版本信息
 */
+ (NSString *__nonnull)versionInfo;

@end

NS_ASSUME_NONNULL_END
