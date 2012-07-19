//
//  TipsCalculatorBrain.h
//  TipsCalculator
//
//  Created by Angel Lee on 12-06-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipsCalculatorBrain : NSObject

-(double) calculateTipWithTotal:(double)total withTax:(double)tax withTip: (double)tip;
-(double) calculateTotal: (double) total withTips:(double) tips; 

@end
