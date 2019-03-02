//
//  UIImage+Image.m
//  YLAnimationSet
//
//  Created by zyl on 2019/2/25.
//  Copyright © 2019 zyl. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation UIImage (Image)

+ (void)load
{
    Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    method_exchangeImplementations(imageWithName, imageName);
}

+ (instancetype)imageWithName:(NSString *)name
{
    UIImage *image = [self imageWithName:name];
    if (image == nil) {
        NSLog(@"名字为空");
    } else {
        NSLog(@"图片名%@", name);
    }
    return image;
}

@end
