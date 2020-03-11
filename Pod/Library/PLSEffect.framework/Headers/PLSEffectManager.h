//
//  PLSEffect.h
//  PLShortVideoKit
//
//  Created by 李政勇 on 2019/12/16.
//  Copyright © 2019 Pili Engineering, Qiniu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PLSEffectConfiguration.h"
#import <OpenGLES/EAGL.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMedia/CoreMedia.h>

NS_ASSUME_NONNULL_BEGIN

@class PLSMakeUpComponentModel, PLSEffectModel, PLSEffectDataManager;
@interface PLSEffectManager : NSObject

/*!
 @property isEffectOn
 @brief 是否开启特效
 
 @since      v1.0.0
 */
@property (nonatomic, assign) BOOL isEffectOn;

/*!
 @property glContext
 @brief OpenGL ES上下文
 
 @since      v1.0.0
 */
@property (nonatomic, strong, readonly) EAGLContext *glContext;

- (instancetype)init NS_UNAVAILABLE;

/*!
 @method sharedWith:configuration:
 @abstract   获取特效manager单例
 
 @param glContext OpenGL ES上下文
 @param config 特效配置
 
 @since      v1.0.0
 */
+ (nullable instancetype)sharedWith:(EAGLContext *)glContext configuration:(PLSEffectConfiguration *)config;

/*!
@method releaseManager
@abstract   释放特效manager单例(若其他地方有引用将不会释放)

@since      v1.0.0
*/
+ (void)releaseManager;

#pragma mark - update effect
/*!
 @method updateFilter:
 @abstract   更新滤镜
 
 @param filter 要展示的滤镜，若要清空效果filter.path设为""
 
 @since      v1.0.0
 */
- (BOOL)updateFilter:(PLSEffectModel *)filter;

/*!
 @method updateFilterIntensity:
 @abstract   更新滤镜强度
 
 @param intensity 滤镜的强度，范围0.0~1.0
 
 @since      v1.0.0
 */
- (BOOL)updateFilterIntensity:(float)intensity;

/*!
 @method updateSticker:
 @abstract   更新贴纸
 
 @param sticker 要展示的贴纸效果，若要清空效果sticker.path设为""
 
 @since      v1.0.0
 */
- (BOOL)updateSticker:(PLSEffectModel *)sticker;

/*!
 @method updateMakeupComponents:
 @abstract   更新美颜美妆
 
 @param components 包含美颜美妆各部分的数组，若要清空效果传入空数组
 
 @since      v1.0.0
 */
- (BOOL)updateMakeupComponents:(NSArray<PLSMakeUpComponentModel *> *)components;

/*!
 @method updateMakeupComponentIntensity:withComponent
 @abstract   更新美颜美妆强度
 
 @param intensity 强度
 @param component 要更新的部分
 
 @since      v1.0.0
 */
- (BOOL)updateMakeupComponentIntensity:(float)intensity withComponent:(PLSMakeUpComponentModel *)component;

#pragma mark - process frame
/*!
 @method processBuffer:withTimestamp:videoOrientation:deviceOrientation
 @abstract   处理帧数据
 
 @param buffer pixelbuffer
 @param timestamp timestap
 @param orientation 摄像头输出的图像方向
 @param deviceOrientation 设备方向
 
 @since      v1.0.0
 */
- (void)processBuffer:(CVPixelBufferRef)buffer withTimestamp:(double)timestamp
     videoOrientation:(AVCaptureVideoOrientation)orientation
    deviceOrientation:(AVCaptureVideoOrientation)deviceOrientation;

/*!
 @method processTexture:width:height:timestamp:videoOrientation:deviceOrientation:
 @abstract   处理帧数据
 
 @param texture texture id
 @param width texture的宽
 @param height texture的高
 @param timestamp 时间戳
 @param orientation 摄像头输出的图像方向
 @param deviceOrientation 设备方向
 
 @since      v1.0.0
 */
- (GLuint)processTexture:(GLuint)texture
                   width:(int)width
                  height:(int)height
               timestamp:(double)timestamp
        videoOrientation:(AVCaptureVideoOrientation)orientation
       deviceOrientation:(AVCaptureVideoOrientation)deviceOrientation;

@end

NS_ASSUME_NONNULL_END
