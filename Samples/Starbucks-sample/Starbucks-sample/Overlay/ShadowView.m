//
//  PPScanningOvershadowView.m
//  PhotoPay-Slovakia
//
//  Created by Luka Zuanovic on 09/11/2016.
//  Copyright © 2016 MicroBlink. All rights reserved.
//

#import "ShadowView.h"

@implementation ShadowView

- (instancetype)initWithFrame:(CGRect)frame
                  shadowColor:(UIColor *)shadowColor
                 scanningRect:(CGRect)scanningRect
                 cornerRadius:(CGFloat)cornerRadius {
    self = [super initWithFrame:frame];
    if (self) {
        _shadowColor = shadowColor;
        _scanningRect = scanningRect;
        _cornerRadius = cornerRadius;
        self.opaque = NO;
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)updateOvershadow:(CGRect)scanningRect {
    self.scanningRect = scanningRect;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);

    UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:self.bounds];
    UIBezierPath *scanningPath = [UIBezierPath bezierPathWithRoundedRect:self.scanningRect cornerRadius:self.cornerRadius];
    [clipPath appendPath:scanningPath];

    clipPath.usesEvenOddFillRule = YES;
    [clipPath addClip];
    [self.shadowColor setFill];
    [clipPath fill];
}

@end
