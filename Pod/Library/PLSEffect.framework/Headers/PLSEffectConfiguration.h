//
//  PLSEffectConfiguration.h
//  PLShortVideoKit
//
//  Created by 李政勇 on 2019/12/17.
//  Copyright © 2019 Pili Engineering, Qiniu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLSEffectConfiguration : NSObject
/*!
 @property modelFileDirPath
 @brief 算法模型文件所在目录绝对路径
 
 @since      v1.0.0
 */
@property (nonatomic, copy) NSString *modelFileDirPath;
/*!
 @property licenseFilePath
 @brief 授权文件绝对路径
 
 @since      v1.0.0
 */
@property (nonatomic, copy) NSString *licenseFilePath;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithModelPath:(NSString *)modelPath licensePath:(NSString *)licensePath;

@end

NS_ASSUME_NONNULL_END
