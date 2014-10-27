//
//  SPImageZoomView.m
//  shanpai5.0
//
//  Created by  on 14-7-2.
//  Copyright (c) 2014年 arrowspeed. All rights reserved.
//

#import "SPImageZoomView.h"
#import "UIImageView+AFNetworking.h"

@interface SPImageZoomView()<UIScrollViewDelegate,UIActionSheetDelegate>

@property (nonatomic, strong)UIImageView   *imageView;

@end

@implementation SPImageZoomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor blackColor];
        _imageView           = [[UIImageView alloc]initWithFrame:self.bounds];
        _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        
        self.delegate = self;
        
        self.showsHorizontalScrollIndicator = false;
        self.showsVerticalScrollIndicator = false;

        //放大缩小倍数
        self.minimumZoomScale = 1;
        self.maximumZoomScale = 3;
        
        UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTaped:)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
        
        UILongPressGestureRecognizer * longPress=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)];
        [self addGestureRecognizer:longPress];
    }
    return self;
}

//长按手势
-(void)longPressAction:(UIGestureRecognizer*)sender
{
    if(sender.state==UIGestureRecognizerStateBegan)
    {
        UIActionSheet * action=[[UIActionSheet alloc]initWithTitle:@"保存图片"
                                                          delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"保存到手机", nil];
        [action showInView:[UIApplication sharedApplication].keyWindow];
    }
}

//保存图片回调函数
#pragma -mark 回调方法
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        UIImageWriteToSavedPhotosAlbum(_imageView.image, self,@selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }else if(buttonIndex==1){
        
    }
}

-(void)image: (UIImage *) image didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo
{
    if(error)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"图片保存失败" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"图片保存成功" delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:nil, nil];
        [alertView show];
    }
}


//双击事件
-(void)doubleTaped:(UITapGestureRecognizer *)sender
{
    if (self.zoomScale > 1.0)
    {
        [self setZoomScale:1.0 animated:true];
    }
    else
    {
        CGPoint point = [sender locationInView:self];
        [self zoomToRect:CGRectMake(point.x-50, point.y-50, 100, 100) animated:true];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView*)scrollView
{
    return self.imageView;
}

- (void)setUrl:(NSURL *)url
{
    _url = url;
    if (self.url)
    {
        [self.imageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"app_picture_default"]];
    }
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    if (self.image)
    {
        // 主线程执行：
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = self.image;
        });
    }
}

@end
