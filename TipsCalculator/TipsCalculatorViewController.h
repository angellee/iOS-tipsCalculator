//
//  TipsCalculatorViewController.h
//  TipsCalculator
//
//  Created by Angel Lee on 12-06-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipsCalculatorViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *tipsBeforeTaxDisplay;
@property (weak, nonatomic) IBOutlet UILabel *totalDisplay;
@property (weak, nonatomic) IBOutlet UILabel *taxDisplay;
@property (weak, nonatomic) IBOutlet UILabel *tipsDisplay;
@property (weak, nonatomic) IBOutlet UILabel *totalAfterTipsDisplay;

@end
