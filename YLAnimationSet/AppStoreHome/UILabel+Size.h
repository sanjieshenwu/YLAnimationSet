//
//  UILabel+Size.h
//  YLAnimationSet
//
//  Created by zyl on 2019/3/2.
//  Copyright © 2019 zyl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Size)
+(CGSize)withString:(NSString *)string font:(UIFont *)font;
+(CGSize)withString:(NSString *)string font:(UIFont *)font ViewWidth:(float)Width;
@end

NS_ASSUME_NONNULL_END
