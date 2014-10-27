//
//  UIImage+BLCategory.h
//  BLCinema
//
//  Created by yhw on 13-4-2.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (BLCategory)
- (UIImage *)imageCroppedToRect:(CGRect)rect;// 剪裁
- (UIImage *)imageScaleToFactor:(CGFloat)factor;// 等比缩放
+ (UIImage *)imageWithColor:(UIColor *)color;// 使用颜色生成图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;// 使用颜色和大小生成图片
+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect;// 使用颜色和大小生成图片
+ (UIImage *)imageWithName:(NSString*)name;// 加载PNG图片，包括@2x，不使用缓存
+ (UIImage *)imageWithName:(NSString*)name type:(NSString *)type;// 加载PNG、JPG图片，包括@2x，不使用缓存
+ (UIImage *)imageWithPath:(NSString*)path;// 加载PNG图片，不包括@2x，不使用缓存
+ (UIImage *)imageWithPath:(NSString*)path type:(NSString *)type;// 加载PNG、JPG图片，不包括@2x，不使用缓存
@end
