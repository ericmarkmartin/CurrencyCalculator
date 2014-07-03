//
//  itemPrice.h
//  CurrencyCalculator
//
//  Created by Eric Martin on 7/1/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itemPrice : NSObject
@property (strong,nonatomic) NSNumber *originalPrice;
@property (strong,nonatomic) NSNumber *salesTax;
@property (strong,nonatomic) NSNumber *percentDiscount;
@property (strong,nonatomic) NSNumber *dollarDiscount;
@property (strong,nonatomic) NSNumber *discountedPrice;
@property (strong,nonatomic) NSNumber *dollarsOff;


-(itemPrice*)initWithOriginalPrice:(NSNumber*)thePrice salesTax:(NSNumber*)theTax percentDiscount:(NSNumber*)thePercentDiscount;

@end
