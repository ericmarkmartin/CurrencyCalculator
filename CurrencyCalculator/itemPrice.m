//
//  itemPrice.m
//  CurrencyCalculator
//
//  Created by Eric Martin on 7/1/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

#import "itemPrice.h"

@implementation itemPrice

@synthesize originalPrice;
@synthesize salesTax;
@synthesize percentDiscount;
@synthesize dollarDiscount;

-(itemPrice*)initWithOriginalPrice:(NSNumber *)thePrice salesTax:(NSNumber *)theTax percentDiscount:(NSNumber *)thePercentDiscount
{
    self = [super init];
    if(self)
    {
        originalPrice = thePrice;
        salesTax = theTax;
        percentDiscount = thePercentDiscount;
    }
    return self;
}

-(NSNumber*) discountedPrice
{
    float dollarsTax = [originalPrice floatValue] * [salesTax floatValue];
    float discountFromPercent = [originalPrice floatValue] * [percentDiscount floatValue]/100;
    float discountedPriceFloat = [originalPrice floatValue] + dollarsTax - discountFromPercent - [dollarDiscount floatValue];
    return [NSNumber numberWithFloat:discountedPriceFloat];
}

-(NSNumber*) dollarsOff
{
    float dollarsOffFloat = [originalPrice floatValue]+([originalPrice floatValue]*[salesTax floatValue]) - [self.discountedPrice floatValue];
    return [NSNumber numberWithFloat:dollarsOffFloat];
}

@end
