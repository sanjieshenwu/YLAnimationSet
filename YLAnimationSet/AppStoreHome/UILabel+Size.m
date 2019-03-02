//
//  UILabel+Size.m
//  YLAnimationSet
//
//  Created by zyl on 2019/3/2.
//  Copyright © 2019 zyl. All rights reserved.
//

#import "UILabel+Size.h"

@implementation UILabel (Size)
+(CGSize)withString:(NSString *)string font:(UIFont *)font
{
    
    CGSize LabelSize;
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0)
    {
        LabelSize=[string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    }
    else
    {
        //ios7 以下版本
        LabelSize=[string sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    }
    
    return LabelSize;
}

+(CGSize)withString:(NSString *)string font:(UIFont *)font ViewWidth:(float)Width
{
    CGSize LabelSize;
    if ([UIDevice currentDevice].systemVersion.floatValue>=7.0)
    {
        LabelSize=[string boundingRectWithSize:CGSizeMake(Width, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    }
    else
    {
        //ios7 以下版本
        LabelSize=[string sizeWithFont:font constrainedToSize:CGSizeMake(Width, MAXFLOAT)];
    }
    
    return LabelSize;
    
}
@end
