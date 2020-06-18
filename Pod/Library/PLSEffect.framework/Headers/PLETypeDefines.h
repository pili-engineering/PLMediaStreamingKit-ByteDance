//
//  PLETypeDefines.h
//  PLSEffect
//
//  Created by 何云旗 on 2020/5/6.
//  Copyright © 2020 Hermes. All rights reserved.
//

#ifndef PLETypeDefines_h
#define PLETypeDefines_h

#import <Foundation/Foundation.h>

#pragma mark - effect type

/*!
@typedef PLSEffectType:
@abstract   特效类型

@since      v1.0.0
*/
typedef NS_ENUM(NSInteger, PLSEffectType) {
    PLSEffectTypeUndefined,
    
    PLSEffectTypeFilter,
    PLSEffectTypeSticker
};


#pragma mark - makeup component type
/*!
 @typedef PLSMakeUpComponentType:
 @abstract   美型类型
 
 @since      v1.0.0
 */
typedef NS_ENUM(NSInteger, PLSMakeUpComponentType) {
    PLSMakeUpComponentTypeUndefined,
    
    PLSMakeUpComponentTypeBeauty,        //美颜
    PLSMakeUpComponentTypeReshape,       //美型
    PLSMakeUpComponentTypeBody,          //美体
    
    PLSMakeUpComponentTypeEnd
};


#pragma mark - makeup type
/*!
 @typedef PLSMakeUpType:
 @abstract   美妆类型
 
 @since      v2.0.0
 */
typedef NS_ENUM(NSInteger, PLSMakeUpType) {
    
    PLSMakeUpTypeUndefined,
    PLSMakeUpTypeLip,           //口红
    PLSMakeUpTypeBlush,         //腮红
    PLSMakeUpTypeFacial,        //修容
    PLSMakeUpTypePupil,         //美瞳
    PLSMakeUpTypeHair,          //染发
    PLSMakeUpTypeEyeshadow,     //眼影
    PLSMakeUpTypeEyebrow,        //眉毛
    
    PLSMakeUpTypeEnd
    
};


#endif /* PLETypeDefines_h */
