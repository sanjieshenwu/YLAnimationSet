//
//  YLOCViewAnimationVC.m
//  YLAnimationSet
//
//  Created by zyl on 2019/2/25.
//  Copyright © 2019 zyl. All rights reserved.
//

#import "YLOCViewAnimationVC.h"
#import "Masonry.h"

#define DURATION 0.5

typedef enum : NSUInteger {
    Fade = 1,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
    
} AnimationType;

@interface YLOCViewAnimationVC ()
{
    NSInteger _subtype;
}

@end

@implementation YLOCViewAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.view addSubview:imageView];
    imageView.frame = self.view.bounds;
    imageView.image = [UIImage imageNamed:@"im_view_back_1"];
    [self initSubviews];
}

- (void)initSubviews
{
    NSArray *array = @[
                       @[@"淡化效果", @"Push效果", @"揭开效果", @"覆盖效果", @"3D立体效果", @"吮吸效果", @"翻转效果", @"波纹效果"],
                       @[@"翻页效果", @"反翻页效果", @"开镜头效果", @"关镜头效果", @"下翻页效果", @"上翻页效果", @"左翻转效果", @"右翻转效果"]
                       ];
    CGFloat barHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width / 7.0;
    CGFloat top = 0;
    CGFloat height = 40;
    for (int i = 0; i < array.count; i ++) {
        top = barHeight + 44 + 40;
        NSArray *subArray = array[i];
        for (int j = 0; j < subArray.count; j ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.view addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.view).offset(width * (3 * i + 1));
                make.top.mas_equalTo(top);
                make.width.mas_equalTo(width * 2);
                make.height.mas_equalTo(height);
            }];
            button.tag = j + 1 + i * 8;
            
            NSString *title = subArray[j];
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor purpleColor]];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            
            top += 20 + height;
        }
    }
}

- (void)buttonAction:(UIButton *)button
{
    AnimationType animationType = button.tag;
    
    NSString *subtypeString;
    
    switch (_subtype) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromBottom;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromTop;
            break;
        default:
            break;
    }
    _subtype += 1;
    if (_subtype > 3) {
        _subtype = 0;
    }
    
    switch (animationType) {
        case Fade:
            [self transitionWithType:kCATransitionFade WithSubtype:subtypeString ForView:self.view];
            break;
        case Push:
            [self transitionWithType:kCATransitionPush WithSubtype:subtypeString ForView:self.view];
            break;
        case Reveal:
            [self transitionWithType:kCATransitionReveal WithSubtype:subtypeString ForView:self.view];
            break;
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn WithSubtype:subtypeString ForView:self.view];
            break;
        case Cube:
            [self transitionWithType:@"cube" WithSubtype:subtypeString ForView:self.view];
            break;
        case SuckEffect:
            [self transitionWithType:@"suckEffect" WithSubtype:subtypeString ForView:self.view];
            break;
        case OglFlip:
            [self transitionWithType:@"oglFlip" WithSubtype:subtypeString ForView:self.view];
            break;
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" WithSubtype:subtypeString ForView:self.view];
            break;
        case PageCurl:
            [self transitionWithType:@"pageCurl" WithSubtype:subtypeString ForView:self.view];
            break;
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" WithSubtype:subtypeString ForView:self.view];
            break;
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" WithSubtype:subtypeString ForView:self.view];
            break;
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" WithSubtype:subtypeString ForView:self.view];
            break;
        case CurlDown:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlDown];
            break;
            
        case CurlUp:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionCurlUp];
            break;
            
        case FlipFromLeft:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromLeft];
            break;
            
        case FlipFromRight:
            [self animationWithView:self.view WithAnimationTransition:UIViewAnimationTransitionFlipFromRight];
            break;
        default:
            break;
    }
}
#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = DURATION;
    
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor purpleColor];
    [self.navigationController.view.layer addAnimation:animation forKey:@"animation"];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma UIView实现动画

- (void) animationWithView:(UIView *)view WithAnimationTransition:(UIViewAnimationTransition)transition
{
    [UIView animateWithDuration:DURATION animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:transition forView:view cache:YES];
    }];
}

@end
