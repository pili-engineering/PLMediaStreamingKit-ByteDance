//
//  PLSEffectModel.h
//  PLShortVideoKit
//
//  Created by 李政勇 on 2019/12/16.
//  Copyright © 2019 Pili Engineering, Qiniu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLSEffectModel : NSObject
/*!
 @property path
 @brief 资源目录绝对路径，path为 "" 则代表清空特效
 
 @since      v1.0.0
 */
@property (nonatomic, copy) NSString *path;

/*!
 @property displayName
 @brief 显示名称
 
 @since      v1.0.0
 */
@property (nonatomic, copy) NSString *displayName;

/*!
 @property tipStr
 @brief 触发类效果提示文案
 
 @since      v1.0.0
 */
@property (nonatomic, copy) NSString *tip;

/*!
 @property intensity
 @brief 默认强度
 
 @since      v1.0.0
 */
@property (nonatomic, assign) float intensity;

/*!
 @property iconImage
 @brief 默认读取path/icon.png文件
 
 @since      v1.0.0
 */
@property (nonatomic, strong) UIImage *iconImage;

@end

NS_ASSUME_NONNULL_END
