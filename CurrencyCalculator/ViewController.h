//
//  ViewController.h
//  CurrencyCalculator
//
//  Created by Eric Martin on 7/1/14.
//  Copyright (c) 2014 Martin Developments. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "itemPrice.h"
#import "graphView.h"

@interface ViewController : UIViewController
<UITextFieldDelegate>
{
    IBOutlet UITextField *originalPriceField;
    IBOutlet UITextField *taxPercentField;
    IBOutlet UITextField *discountPercentField;
    
    IBOutlet UILabel *priceWithTaxLabel;
    IBOutlet UILabel *discountedPriceLabel;
    
    IBOutlet UIButton *calculateButton;
    
    IBOutlet graphView *pieView;
}


-(IBAction)calculate:(id)sender;

-(NSString*)stringWithoutLeadingZeros:(NSString*)string;


@end

