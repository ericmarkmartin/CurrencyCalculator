//
//  ViewController.m
//  CurrencyCalculator
//
//  Created by Eric Martin on 7/1/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)calculate:(id)sender
{
    itemPrice *iP = [[itemPrice alloc] initWithOriginalPrice:@([originalPriceField.text floatValue]) salesTax:@([taxPercentField.text floatValue]/100.0) percentDiscount:@([discountPercentField.text floatValue])];
    priceWithTaxLabel.text = [NSString stringWithFormat:@"Sales Tax: $%.2f",([iP originalPrice].floatValue * [iP salesTax].floatValue)+[iP originalPrice].floatValue];
    discountedPriceLabel.text = [NSString stringWithFormat:@"After Discount: $%.2f",[iP discountedPrice].floatValue];
    priceWithTaxLabel.hidden = NO;
    discountedPriceLabel.hidden = NO;
    [originalPriceField resignFirstResponder];
    [taxPercentField resignFirstResponder];
    [discountPercentField resignFirstResponder];
    NSLog(@"Dollars Off: %f. Total Price: %f",[iP dollarsOff].floatValue,[[priceWithTaxLabel.text substringFromIndex:12] floatValue]);
    pieView.percentOff = [iP dollarsOff].floatValue/[[priceWithTaxLabel.text substringFromIndex:12] floatValue];
    NSLog(@"%f",pieView.percentOff);
    [pieView setNeedsDisplay];
    [UIView transitionWithView:pieView duration:.65 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{[pieView.layer displayIfNeeded];} completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)stringWithoutLeadingZeros:(NSString *)string
{
    while ([string hasPrefix:@"0"] || [string hasPrefix:@"."])
    {
        string = [string stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
    }
    return [string stringByReplacingOccurrencesOfString:@"." withString:@""];
}



#pragma mark - UITextFieldDelegate Methods

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if(![originalPriceField.text isEqualToString:@""] && ![taxPercentField.text isEqualToString:@""] && ![discountPercentField.text isEqualToString:@""])
    {
        calculateButton.enabled = YES;
        calculateButton.alpha = 1.0;
    }
    else
    {
        calculateButton.enabled = NO;
        calculateButton.alpha = 0.4;
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if([textField.text isEqualToString:@""])
    {
        textField.text = @"00.00";
    }
    NSLog(@"%ld",(long)textField.tag);
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    char char1;
    char char2;
    char char3;
    NSString *tmpString;
    NSString *restOfString;
    if([string isEqualToString:@""])
    {
        tmpString = [self stringWithoutLeadingZeros:[textField.text substringToIndex:[textField.text length]-2]];
        string = [self stringWithoutLeadingZeros:[textField.text substringWithRange:NSMakeRange([textField.text length]-2, 1)]];
    }
    //01.23
    else
    {
        tmpString = [self stringWithoutLeadingZeros:textField.text];
    }
    switch ([tmpString length])
    {
        case 0:
            textField.text = [NSString stringWithFormat:@"00.0%@",string];
            break;
            
        case 1:
            textField.text = [NSString stringWithFormat:@"00.%@%@",[self stringWithoutLeadingZeros:textField.text],string];
            break;
            
        case 2:
            char1 = [tmpString characterAtIndex:0];
            char2 = [tmpString characterAtIndex:1];
            textField.text = [NSString stringWithFormat:@"0%c.%c%@",char1,char2,string];
            break;
            
        case 3:
            char1 = [tmpString characterAtIndex:0];
            char2 = [tmpString characterAtIndex:1];
            char3 = [tmpString characterAtIndex:2];
            textField.text = [NSString stringWithFormat:@"%c%c.%c%@",char1,char2,char3,string];
            break;
            
        default:
            char1 = [tmpString characterAtIndex:[tmpString length]-1];
            restOfString = [tmpString substringToIndex:[tmpString length]-1];
            textField.text = [NSString stringWithFormat:@"%@.%c%@",restOfString,char1,string];
            break;
    }
    return NO;
}

@end
