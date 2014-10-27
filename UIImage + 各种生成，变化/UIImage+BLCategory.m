//
//  UIImage+BLCategory.m
//  BLCinema
//
//  Created by yhw on 13-4-2.
//
//

#import "UIImage+BLCategory.h"
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

@implementation UIImage (BLCategory)
- (UIImage *)imageCroppedToRect:(CGRect)rect {
	CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
	UIImage *cropped = [UIImage imageWithCGImage:imageRef];
	CGImageRelease(imageRef);
	return cropped;
}
- (UIImage *)imageScaleToFactor:(CGFloat)factor;
{
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width * factor, self.size.height * factor));
    [self drawInRect:CGRectMake(0, 0, self.size.width * factor, self.size.height * factor)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
+ (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color rect:CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)];
}
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    return [self imageWithColor:color rect:CGRectMake(0, 0, size.width, size.height)];
}
+ (UIImage *)imageWithColor:(UIColor *)color rect:(CGRect)rect {
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage*)imageWithName:(NSString*)name {
	return [[self class] imageWithName:name type:@"png"];
}
+ (UIImage*)imageWithName:(NSString*)name type:(NSString *)type {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone && IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f) {// iPhone5
        name = [name stringByAppendingString:@"-568h"];
    }
    CGFloat s = 1.0f;
	if([[UIScreen mainScreen] respondsToSelector:@selector(scale)]){
		s = [[UIScreen mainScreen] scale];
	}
	NSString *path = [NSString stringWithFormat:@"%@%@.%@", name, s > 1.0f ? @"@2x":@"", type];
    ;
	return [UIImage imageWithCGImage:[UIImage imageWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:path]].CGImage scale:s orientation:UIImageOrientationUp];
}
+ (UIImage*)imageWithPath:(NSString*)path {
    return [self imageWithPath:path type:@"png"];
}
+ (UIImage*)imageWithPath:(NSString*)path type:(NSString *)type {
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:path ofType:type]];
}
@end
