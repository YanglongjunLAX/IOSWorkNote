//
//  ViewController.m
//  webViewTest
//
//  Created by liang chunyan on 14-8-7.
//  Copyright (c) 2014年 BaiLing-ShanBo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, readonly) UIWebView   *webView;

@end

@implementation ViewController
@synthesize webView = _webView;

- (UIWebView *)webView
{
    if (!_webView)
    {
        _webView = [[UIWebView alloc] initWithFrame:CGRectInset(self.view.bounds, 20, 40)];
//        _webView.scalesPageToFit = YES;
        _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _webView.delegate = self;
    }
    return _webView;
}

- (UIRectEdge)edgesForExtendedLayout
{
    return UIRectEdgeLeft | UIRectEdgeRight | UIRectEdgeBottom;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.webView];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"js" ofType:@"html"];
    NSURL* url = [NSURL fileURLWithPath:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    [self.webView loadRequest:request];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	NSString *urlString = [[request URL] absoluteString];
    NSLog(@"绝对路径 ===== %@", urlString);
    NSLog(@"相对路径 ===== %@",[[request URL] relativeString]);
	NSArray *urlComponents = [urlString componentsSeparatedByString:@"://"];
    NSLog(@"urlComponents ===== %@", urlComponents);
	if (urlComponents.count > 0 && [[urlComponents objectAtIndex:0] isEqualToString:@"objc"]) {
        if (urlComponents.count > 1) {
            NSArray *funcAndParams = [(NSString *)[urlComponents objectAtIndex:1] componentsSeparatedByString:@":/"];
            //            NSLog(@"%@", funcAndParams);
            if (funcAndParams.count > 0) {
                NSString *funcStr = [funcAndParams objectAtIndex:0];
                if ([funcStr isEqualToString:@"selectSeat"]) {// 0
                    if ([funcAndParams count]) {
                        [self selectSeat];
                        return NO;
                    }
                }
                else if ([funcStr isEqualToString:@"selectSeat:"]) {// 1
                    if ([funcAndParams count] > 1) {
                        [self selectSeat:[funcAndParams objectAtIndex:1]];
                        return NO;
                    }
                }
                else if ([funcStr isEqualToString:@"selectSeat:param2:"]) {// 2
                    if ([funcAndParams count] > 2) {
                        [self selectSeat:[funcAndParams objectAtIndex:1] param2:[funcAndParams objectAtIndex:2]];
                        return NO;
                    }
                }
            }
            
        }
	}
	return YES;
}

- (void)selectSeat
{
    NSLog(@"call");
}

- (void)selectSeat:(NSString *)parm1
{
    NSLog(@"parm1->%@",parm1);
}

- (void)selectSeat:(NSString *)parm1 param2:(NSString*)parm2
{
    NSLog(@"parm1 ->%@,parm2->%@",parm1,parm2);
}

@end
