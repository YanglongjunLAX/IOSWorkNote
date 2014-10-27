//
//  SPImageZoomView.h
//  shanpai5.0
//
//  Created by  on 14-7-2.
//  Copyright (c) 2014年 arrowspeed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPImageZoomView : UIScrollView

//默认的图片
@property (nonatomic, strong) UIImage   *placeHolderImage;

//图片
@property (nonatomic, strong) UIImage   *image;

//图片地址
@property (nonatomic, strong) NSURL  *url;

@end
