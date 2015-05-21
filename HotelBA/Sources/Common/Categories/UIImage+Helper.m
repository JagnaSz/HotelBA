//
// Created by Agnieszka Szczurek on 21.05.15.
// Copyright (c) 2015 AgnieszkaSzczurek. All rights reserved.
//

#import "UIImage+Helper.h"


@implementation UIImage (Helper)

- (UIImage *)imageByFilledWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, .0);
    [color set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect bounds = CGRectZero;
    bounds.size = self.size;
    CGContextTranslateCTM(context, 0, bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextClipToMask(context, bounds, self.CGImage);
    CGContextFillRect(context, bounds);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

@end