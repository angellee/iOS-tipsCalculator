//
//  TipsCalculatorBrain.m
//  TipsCalculator
//
//  Created by Angel Lee on 12-06-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TipsCalculatorBrain.h"
#include <math.h>
@implementation TipsCalculatorBrain


-(double) calculateTipWithTotal:(double)total withTax:(double)tax withTip: (double)tip{

    double result = total - (total * tax/100);
    result = result *  tip/100;
    result = round(result *100.0)/100.0;
    return result;
}

-(double) calculateTotal: (double) total withTips:(double) tips{
    double myTotal = total + tips;
    return myTotal;
}

@end
