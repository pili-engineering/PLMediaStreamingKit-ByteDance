//
//  PLSMakeupModel.h
//  PLSEffect
//
//  Created by 何云旗 on 2020/5/6.
//  Copyright © 2020 Hermes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>
#import "PLETypeDefines.h"

NS_ASSUME_NONNULL_BEGIN

@class PLSMakeUpComponentModel;

/*!
@class PLSMakceUpModel
@abstract 美妆资源的类

@discussion 美妆资源文件层级结构为二级结构，可使用此类获取美妆效果。
*/
@interface PLSMakeupModel : NSObject

/*!
 @property displayName
 @brief 显示名称
 
 @since      v2.0.0
 */
@property (nonatomic, copy) NSString *displayName;

/*!
 @property iconImage
 @brief 默认读取 config.json 文件中 iconName 对应图片名称
 
 @since      v2.0.0
 */
@property (nonatomic, strong) UIImage *iconImage;

/*!
 @property effectList
 @brief 当前类型下（makeupType）所有美妆列表
 
 @since      v2.0.0
 */
@property (nonatomic, strong) NSArray <PLSMakeUpComponentModel *> *effectList;

@end

NS_ASSUME_NONNULL_END
