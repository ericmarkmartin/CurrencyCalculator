//
//  graphView.m
//  CurrencyCalculator
//
//  Created by Eric Martin on 7/1/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

#import "graphView.h"

@implementation graphView

@synthesize percentOff;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    int radius = (rect.size.width-5)/2;
    int centerX = radius;
    int centerY = radius;

    

    UIBezierPath* circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(rect.origin.x,rect.origin.y,rect.size.width-5,rect.size.height-5)];
    [[UIColor orangeColor] setFill];
    [circlePath fill];
    
    
    //Arc
    double arcRadians = (2*M_PI)*percentOff;
    NSLog(@"%g",arcRadians);
    CGContextSetRGBFillColor(context, 0.5, 0.0, 0.5, 1.0);
    CGContextAddArc(context, centerX, centerY, radius, M_PI_2*3, M_PI_2*3+arcRadians, NO);
    CGContextAddLineToPoint(context, centerX, centerY);
    CGContextAddLineToPoint(context, centerX, 0);
    CGContextClosePath(context);
       CGContextFillPath(context);
  //  CGContextStrokePath(context);
    
}


@end
