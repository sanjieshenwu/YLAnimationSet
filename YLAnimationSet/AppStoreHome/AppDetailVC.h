//
//  AppDetailVC.h
//  YLAnimationSet
//
//  Created by zyl on 2019/3/2.
//  Copyright © 2019 zyl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppDetailVC : UIViewController
@property (strong, nonatomic) UIImage *bgImage;
@property (strong, nonatomic) NSString *imageName;
@property (strong, nonatomic) NSString *titles;
@property (strong, nonatomic) NSString *titleTwo;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSIndexPath *selectIndexPath;
@end

NS_ASSUME_NONNULL_END
