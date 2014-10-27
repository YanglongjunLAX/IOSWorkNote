//
//  AnimationViewController.m
//  Animation
//
//  Created by fei lu on 13-3-12.
//  QQ:383571785
//  email:lufei_fly@163.com
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "AnimationViewController.h"
static NSString * const AnimationKey = @"animationKey";
@interface AnimationViewController ()
{
    CALayer *_layer;
}
@end

@implementation AnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrSelSection = [[NSMutableArray alloc] initWithCapacity:0];
    arrSection = [[NSArray alloc] initWithObjects:@"CALayer",@"UIViewAnimation",@"CATransition",@"CABasicAnimation",@"CAKeyframeAnimation",@"CAAnimationGroup",@"CATransfrom3D", nil];
    arrLayerItem = [[NSArray alloc] initWithObjects:@"圆角红边框", nil];
    arrUIViewItem = [[NSArray alloc] initWithObjects:@"CurlUp(上翻页)",@"Flip(从左翻转)",@"block(下翻页)",@"block(从右翻转)", nil];
    arrCATransitionItem = [[NSArray alloc] initWithObjects:@"cube(立方体)",@"Push(推出)",@"Reveal(揭开)",@"MoveIn(覆盖)",@"Fade(淡出)",@"suckEffect(吸收)",@"oglFlip(翻转)",@"rippleEffect(波纹)",@"Open(镜头开)",@"Close(镜头关)", nil];
    arrCABasicAnimationItem = [[NSArray alloc]initWithObjects:@"scale(比例缩放)",@"opacity(透明)", nil];
    arrCAKeyframeAnimationItem = [[NSArray alloc]initWithObjects:@"border(边框闪动)",@"position(位置)", nil];
    arrCAAnimationGroup = [[NSArray alloc]initWithObjects:@"动画组", nil];
    arrCATransfrom3D = [[NSArray alloc] initWithObjects:@"UIView",@"Base",@"Keyframe",@"Affine", nil];
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width/2, self.view.frame.size.height);
    tableView1 = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    tableView1.delegate = self;
    tableView1.dataSource = self;
    tableView1.backgroundColor = [UIColor clearColor];
    [tableView1.layer setBorderWidth:1];
    [tableView1.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.view addSubview:tableView1];
    [tableView1 bringSubviewToFront:image];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 130, 30)];
    label.text = @"跳动文字";
    [label setTextAlignment:UITextAlignmentCenter];
    label.backgroundColor = [UIColor clearColor];
    [image addSubview:label];
}

- (void)viewDidUnload
{
    image = nil;
    image = nil;
    image = nil;
    animationDuration = nil;
    animationDurationLabel = nil;
    enableAnimation = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger count = 0;
    for (int i = 0; i < arrSelSection.count; i++) {
        NSString *strSection = [NSString stringWithFormat:@"%@",[arrSelSection objectAtIndex:i]];
        NSInteger selSection = strSection.integerValue;
        if (section == selSection) {
            return 0;
        }
    }
    if(section == 0){
        count = arrLayerItem.count;
    }else if (section == 1) {
        count = arrUIViewItem.count;
    }else if(section == 2){
        count = arrCATransitionItem.count;
    }else if(section == 3){
        count = arrCABasicAnimationItem.count;
    }else if(section == 4){
        count = arrCAKeyframeAnimationItem.count;
    }else if(section == 5){
        count = arrCAAnimationGroup.count;
    }else if(section == 6){
        count = arrCATransfrom3D.count;
    }
    return count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return arrSection.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 20)];
    [view.layer setBorderWidth:1];
    UIButton *customView = [[UIButton alloc] initWithFrame:view.bounds];
    [customView.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [customView setBackgroundColor:[UIColor orangeColor]];
    [customView setTitle:[arrSection objectAtIndex:section] forState:UIControlStateNormal];
    
    [customView setTag:section];
    [customView addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:customView];
    
    BOOL isSelSection = NO;
    for (int i = 0; i < arrSelSection.count; i++) {
        NSString *strSection = [NSString stringWithFormat:@"%@",[arrSelSection objectAtIndex:i]];
        NSInteger selSection = strSection.integerValue;
        if (section == selSection) {
            isSelSection = YES;
            [customView setImage:[UIImage imageNamed:@"jiantou_up.png"] forState:UIControlStateNormal];
            break;
        }
    }
    if (!isSelSection) {
        [customView setImage:[UIImage imageNamed:@"jiantou_down.png"] forState:UIControlStateNormal];
    }
    [customView setImageEdgeInsets:UIEdgeInsetsMake(3, 145, 3, 0)];
    [customView setTitleEdgeInsets:UIEdgeInsetsMake(0, -25, 0, 15)];
    return view;
}

-(void)onClick:(id)sender{
    UIButton *btn = (UIButton *)sender;
    BOOL isSelSection = NO;
    tmpSection = btn.tag;
    for (int i = 0; i < arrSelSection.count; i++) {
        NSString *strSection = [NSString stringWithFormat:@"%@",[arrSelSection objectAtIndex:i]];
        NSInteger selSection = strSection.integerValue;
        if (tmpSection == selSection) {
            isSelSection = YES;
            [arrSelSection removeObjectAtIndex:i];
            break;
        }
    }
    if (!isSelSection) {
        [arrSelSection addObject:[NSString stringWithFormat:@"%i",tmpSection]];
    }
    UITableView *tableView = (UITableView *)[[btn superview] superview];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:3];
    [tableView reloadData];
    [UIView commitAnimations];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    BOOL isSelSection = NO;
    for (int i = 0; i < arrSelSection.count; i++) {
        NSString *strSection = [NSString stringWithFormat:@"%@",[arrSelSection objectAtIndex:i]];
        NSInteger selSection = strSection.integerValue;
        if (section == selSection) {
            isSelSection = YES;
            break;
        }
    }
    if (!isSelSection) {
        NSString *item = nil;
        if (section == 0) {
            item = [arrLayerItem objectAtIndex:indexPath.row];
        }else if (section == 1) {
            item = [arrUIViewItem objectAtIndex:indexPath.row];
        }else if(section == 2){
            item = [arrCATransitionItem objectAtIndex:indexPath.row];
        }else if(section == 3){
            item = [arrCABasicAnimationItem objectAtIndex:indexPath.row];
        }else if(section == 4){
            item = [arrCAKeyframeAnimationItem objectAtIndex:indexPath.row];
        }else if(section == 5){
            item = [arrCAAnimationGroup objectAtIndex:indexPath.row];
        }else if(section == 6){
            item = [arrCATransfrom3D objectAtIndex:indexPath.row];
        }
        
        [cell.textLabel setFont:[UIFont systemFontOfSize:18]];
        cell.textLabel.text = item;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self setAnimation:indexPath];
}

-(void)setAnimation:(NSIndexPath *) indexPath{
    switch (indexPath.section) {
        case 0:{
            [self setLayerAnimation:indexPath.row];
        }
            break;
        case 1:
        {
            [self setUIViewAnimation:indexPath.row];
        }
            break;
        case 2:
        {
            [self setCATransition:indexPath.row];
        }
            break;
        case 3:
        {
            [self setCABasicAnimation:indexPath.row];
        }
            break;
        case 4:
        {
            [self setCAKeyframeAnimation:indexPath.row];
        }
            break;
        case 5:
        {
            [self setCAAnimationGroup:indexPath.row];
        }
            break;
        case 6:{
            [self setCATransfrom3D:indexPath.row];
        }
            break;
        default:
            break;
    }
}

-(void)setLayerAnimation:(NSInteger) row{
    switch (row) {
        case 0:
        {
            [CATransaction begin];
            [CATransaction setDisableActions:!enableAnimation.isOn];
            [CATransaction setAnimationDuration:animationDuration.value];
            [_layer setCornerRadius:[_layer cornerRadius]==0?30:0];
            [_layer setBorderWidth:[_layer borderWidth]==0?5:0];
            [_layer setBorderColor:[UIColor redColor].CGColor];
            [CATransaction commit];
        }
            break;
        default:
            break;
    }
    
}

//基础动画
-(void)setUIViewAnimation:(NSInteger) row{
    switch (row) {
        case 0://CurlUp
        {
            [UIView beginAnimations:@"animationID" context:nil];
            [UIView setAnimationDuration:animationDuration.value];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [UIView setAnimationRepeatAutoreverses:enableAnimation.isOn];
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:image cache:YES];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(didStop)];
            [UIView commitAnimations];
        }
            break;
        case 1://FlipFromLeft
        {
            [UIView beginAnimations:@"animationID" context:nil];
            [UIView setAnimationDuration:animationDuration.value];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [UIView setAnimationRepeatAutoreverses:enableAnimation.isOn];
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:image cache:YES];
            [UIView commitAnimations];
        }
            break;
        case 2://block CurlDown
        {
            [UIView animateWithDuration:animationDuration.value animations:^(void){
                [UIView setAnimationRepeatAutoreverses:enableAnimation.isOn];
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:image cache:YES];
            }];
        }
            break;
        case 3://block FlipFromRight
        {
            [UIView animateWithDuration:animationDuration.value delay:.5 options:UIViewAnimationOptionCurveEaseOut animations:^(void){
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:image cache:YES];
            } completion:^(BOOL finish){
                animationDurationLabel.text = @"动画结束";
            }];
        }
            break;
        default:
            break;
    }
}

- (void)didStop
{
    [UIView beginAnimations:@"animationID" context:nil];
    [UIView setAnimationDuration:animationDuration.value];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationRepeatAutoreverses:enableAnimation.isOn];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:image cache:YES];
    [UIView commitAnimations];
}

-(void)setCATransition:(NSInteger) row{
    switch (row) {
        case 0://cube
        {
            CATransition *transtion = [CATransition animation];
//            [transtion setStartProgress:0.5];
//            [transtion setEndProgress:0.6];
            transtion.duration = animationDuration.value;
            [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            [transtion setType:@"cube"];
            [transtion setSubtype:kCATransitionFromTop];
            [image.layer addAnimation:transtion forKey:@"transtionKey"];
            
        }
            break;
        case 1://kCATransitionPush
        {
            CATransition *transtion = [CATransition animation];
            transtion.duration = animationDuration.value;
            [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            [transtion setType:kCATransitionPush];
            [transtion setSubtype:kCATransitionFromTop];
            [image.layer addAnimation:transtion forKey:AnimationKey];
        }
            break;
        case 2:
        {
            CATransition *transtion = [CATransition animation];
            transtion.duration = animationDuration.value;
            [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            [transtion setType:kCATransitionReveal];
            [transtion setSubtype:kCATransitionFromTop];
            [image.layer addAnimation:transtion forKey:@"transtionKey"];
        }
            break;
        case 3:
        {
            CATransition *transtion = [CATransition animation];
            transtion.duration = animationDuration.value;
            [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            [transtion setType:kCATransitionMoveIn];
            [transtion setSubtype:kCATransitionFromTop];
            [transtion setDelegate:self];
            [image.layer addAnimation:transtion forKey:@"transtionKey"];
        }
            break;
        case 4://kCATransitionFade
        {
            CATransition *transtion = [CATransition animation];
            transtion.duration = animationDuration.value;
            [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            [transtion setType:kCATransitionFade];
            [transtion setSubtype:kCATransitionFromTop];
            [image setImage:[UIImage imageNamed:@"img.jpeg"]];
            [image.layer addAnimation:transtion forKey:AnimationKey];
        }
            break;
        case 5:
        {
            CATransition *transtion = [CATransition animation];
            transtion.duration = animationDuration.value;
            [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            [transtion setType:@"suckEffect"];
            [transtion setSubtype:kCATransitionFromTop];
            [image.layer addAnimation:transtion forKey:@"transtionKey"];
        }
            break;
        case 6:
        {
            CATransition *transtion = [CATransition animation];
            transtion.duration = animationDuration.value;
            [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            [transtion setType:@"oglFlip"];
            [transtion setSubtype:kCATransitionFromTop];
            [image.layer addAnimation:transtion forKey:@"transtionKey"];
        }
            break;
        case 7:
        {
            CATransition *transtion = [CATransition animation];
            [transtion setStartProgress:.2];
            [transtion setEndProgress:.8];
            transtion.duration = animationDuration.value;
            [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            [transtion setType:@"rippleEffect"];
            [transtion setSubtype:kCATransitionFromTop];
            [image.layer addAnimation:transtion forKey:@"transtionKey"];
        }
            break;
        case 8://cameraIrisHollowOpen
        {
            CATransition *transtion = [CATransition animation];
            transtion.duration = animationDuration.value;
            [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            [transtion setType:@"cameraIrisHollowOpen"];
            [transtion setSubtype:kCATransitionFromTop];
            [image.layer addAnimation:transtion forKey:@"transtionKey"];
        }
            break;
        case 9://cameraIrisHollowClose
        {
            CATransition *transtion = [CATransition animation];
            transtion.duration = animationDuration.value;
            [transtion setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
            [transtion setType:@"cameraIrisHollowClose"];
            [transtion setSubtype:kCATransitionFromTop];
            [image.layer addAnimation:transtion forKey:@"transtionKey"];
        }
            break;
        default:
            break;
    }
}

-(void)setCABasicAnimation:(NSInteger) row{
    switch (row) {
        case 0:
        {
            CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            [basic setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            [basic setFromValue:[NSNumber numberWithFloat:1]];
            [basic setToValue:[NSNumber numberWithFloat:.3]];
            [basic setDuration:animationDuration.value];
            [basic setDelegate:self];
            [image.layer addAnimation:basic forKey:AnimationKey];
            
        }
            break;
        case 1:
        {
            CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"opacity"];
            [basic setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
            [basic setFromValue:[NSNumber numberWithFloat:1]];
            [basic setToValue:[NSNumber numberWithFloat:.3]];
            [basic setDuration:animationDuration.value];
            [image.layer addAnimation:basic forKey:AnimationKey];
        }
            break;
        default:
            break;
    }
}

-(void)setCAKeyframeAnimation:(NSInteger) row{
    switch (row) {
        case 0:
        {
            CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"borderWidth"];
            keyframe.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0],
                               [NSNumber numberWithFloat:5],
                               [NSNumber numberWithFloat:10],
                               [NSNumber numberWithFloat:15],nil];
            keyframe.repeatCount = MAXFLOAT;
            keyframe.autoreverses = enableAnimation.isOn;
            keyframe.duration = animationDuration.value;
            keyframe.delegate = self;
            [image.layer addAnimation:keyframe forKey:AnimationKey];
        }
            break;
        case 1://position
        {
            UIBezierPath *path = [UIBezierPath bezierPath];
            //            [path moveToPoint:image.frame.origin];
            [path moveToPoint:CGPointMake(image.frame.origin.x + image.frame.size.width/2, image.frame.origin.y + image.frame.size.height/2)];
            [path addLineToPoint:CGPointMake(image.frame.origin.x + image.frame.size.width/2,400)];
            [path addLineToPoint:CGPointMake(20, 400)];
            CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            keyframe.path = path.CGPath;
            keyframe.duration = animationDuration.value;
            [image.layer addAnimation:keyframe forKey:AnimationKey];
        }
            break;
        default:
            break;
    }
}

-(void)setCAAnimationGroup:(NSInteger) row{
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [basic setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [basic setFromValue:[NSNumber numberWithFloat:1]];
    [basic setToValue:[NSNumber numberWithFloat:.3]];
    
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.x"];
    keyframe.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:0],[NSNumber numberWithFloat:M_PI], nil];
    
    [group setDuration:animationDuration.value];
    [group setAnimations:[NSArray arrayWithObjects:basic,keyframe, nil]];
    [image.layer addAnimation:group forKey:AnimationKey];
}

-(void)setCATransfrom3D:(NSInteger) row{
    switch (row) {
        case 0:
        {
            [UIView animateWithDuration:animationDuration.value animations:^{
                [UIView setAnimationRepeatCount:MAXFLOAT];
                [UIView setAnimationRepeatAutoreverses:enableAnimation.isOn];
                CATransform3D transform = CATransform3DMakeTranslation(0, -150, 0);
                CATransform3D trans = CATransform3DScale(transform, 1.5, 1.5, 10);
                [label.layer setTransform:trans];
            } completion:^(BOOL finished) {
                animationDurationLabel.text = @"finished";
            }];
        }
            break;
        case 1:{
            CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            [basic setDuration:animationDuration.value];
            [basic setRepeatCount:MAXFLOAT];
            [basic setAutoreverses:enableAnimation.isOn];
            
            NSValue *valueForm = [NSValue valueWithCATransform3D:CATransform3DIdentity];
            CATransform3D transTo = CATransform3DMakeScale(.5, .5, 0);
            NSValue *valueTo = [NSValue valueWithCATransform3D:transTo];
            
            [basic setFromValue:valueForm];
            [basic setToValue:valueTo];
            
            [image.layer addAnimation:basic forKey:AnimationKey];
        }
            break;
        case 2:{
            CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
            [keyframe setRepeatCount:MAXFLOAT];
            [keyframe setDuration:animationDuration.value];
            [keyframe setAutoreverses:enableAnimation.isOn];
            
            CATransform3D transForm = CATransform3DIdentity;
            CATransform3D transTo = CATransform3DMakeScale(.5, .5, 0);
            NSValue *valueForm = [NSValue valueWithCATransform3D:transForm];
            NSValue *valueTo = [NSValue valueWithCATransform3D:transTo];
            
            [keyframe setValues:[NSArray arrayWithObjects:valueTo,valueForm,nil]];
            
            [image.layer addAnimation:keyframe forKey:AnimationKey];
        }
            break;
        case 3:{
            CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform"];
            [basic setRepeatCount:MAXFLOAT];
            [basic setDuration:animationDuration.value];
            [basic setAutoreverses:enableAnimation.isOn];
            
            NSValue *valueForm = [NSValue valueWithCATransform3D:CATransform3DIdentity];
            CGAffineTransform affine = CGAffineTransformMakeTranslation(0, -150);
            CATransform3D t = CATransform3DMakeAffineTransform(affine);
            CATransform3D trans = CATransform3DScale(t, 1.5, 1.5, 10);
            NSValue *valueTo = [NSValue valueWithCATransform3D:trans];
            
            [basic setFromValue:valueForm];
            [basic setToValue:valueTo];
            
            [label.layer addAnimation:basic forKey:AnimationKey];
        }
            break;
        default:
            break;
    }
}

-(void)animationDidStart:(CAAnimation *)anim{
    animationDurationLabel.text = @"开始动画";
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    animationDurationLabel.text = @"动画完毕";
}

- (IBAction)animationDurationChanged:(id)sender {
    [image.layer removeAnimationForKey:AnimationKey];
    [label.layer removeAllAnimations];
    animationDuration = (UISlider *)sender;
    [animationDurationLabel setText:[NSString stringWithFormat:@"%1.1f", animationDuration.value]];
}


@end
