//
//  PLSMakeUpComponentModel.h
//  PLShortVideoKit
//
//  Created by 李政勇 on 2019/12/16.
//  Copyright © 2019 Pili Engineering, Qiniu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLSMakeUpComponentModel : NSObject
/*!
 @property path
 @brief 资源目录绝对路径
 
 @since      v1.0.0
 */
@property (nonatomic, copy) NSString *path;

/*!
 @property internalKey
 @brief 算法内部识别类型的key
 
 @since      v1.0.0
 */
@property (nonatomic, copy) NSString *internalKey;

/*!
 @property displayName
 @brief 显示名称
 
 @since      v1.0.0
 */

@property (nonatomic, copy) NSString *displayName;

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
