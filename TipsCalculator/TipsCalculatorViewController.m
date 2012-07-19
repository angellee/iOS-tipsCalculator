//
//  TipsCalculatorViewController.m
//  TipsCalculator
//
//  Created by Angel Lee on 12-06-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TipsCalculatorViewController.h"
#import "TipsCalculatorBrain.h"

@interface TipsCalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) TipsCalculatorBrain *brain;
@end

@implementation TipsCalculatorViewController
@synthesize tipsDisplay;
@synthesize totalAfterTipsDisplay;
@synthesize tipsBeforeTaxDisplay;
@synthesize totalDisplay;
@synthesize taxDisplay;
@synthesize userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

-(TipsCalculatorBrain *) brain{
    if(!_brain) _brain = [[TipsCalculatorBrain alloc] init];
    return _brain;
}


- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit = [sender currentTitle];
    if(self.userIsInTheMiddleOfEnteringANumber && self.totalDisplay.text!=@"0.00"){
    self.totalDisplay.text = [self.totalDisplay.text stringByAppendingString:digit];
   
        
    }else{
        self.totalDisplay.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }

    // result == tips before tax
    double result = [self.brain calculateTipWithTotal:[self.totalDisplay.text doubleValue] withTax:[self.taxDisplay.text doubleValue] withTip:[self.tipsDisplay.text doubleValue]];

    self.tipsBeforeTaxDisplay.text = [NSString stringWithFormat:@"%.2f", result];
    
    double totalWithTips = [self.brain calculateTotal:[self.totalDisplay.text doubleValue] withTips:result];
    
    self.totalAfterTipsDisplay.text = [NSString stringWithFormat:@"%.2f", totalWithTips];
    
}

- (IBAction)cancelPressed {
    self.totalDisplay.text = @"0";
    self.tipsBeforeTaxDisplay.text = @"0";
    self.totalAfterTipsDisplay.text = @"0";
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)taxStepper:(UIStepper *)sender {
        
    self.taxDisplay.text = [[NSNumber numberWithDouble:[sender value]]stringValue];
    
    double result = [self.brain calculateTipWithTotal:[self.totalDisplay.text doubleValue] withTax:[self.taxDisplay.text doubleValue] withTip:[self.tipsDisplay.text doubleValue]];
    
     self.tipsBeforeTaxDisplay.text = [NSString stringWithFormat:@"%.2f", result];

    
    double totalWithTips = [self.brain calculateTotal:[self.totalDisplay.text doubleValue] withTips:result];
    
    self.totalAfterTipsDisplay.text = [NSString stringWithFormat:@"%.2f", totalWithTips];
    
}

- (IBAction)tipsStepper:(UIStepper *)sender {
     
    self.tipsDisplay.text = [[NSNumber numberWithDouble:[sender value]]stringValue]; 
    
    double result = [self.brain calculateTipWithTotal:[self.totalDisplay.text doubleValue] withTax:[self.taxDisplay.text doubleValue] withTip:[self.tipsDisplay.text doubleValue]];
    
     self.tipsBeforeTaxDisplay.text = [NSString stringWithFormat:@"%.2f", result];
    
    double totalWithTips = [self.brain calculateTotal:[self.totalDisplay.text doubleValue] withTips:result];
    
    self.totalAfterTipsDisplay.text = [NSString stringWithFormat:@"%.2f", totalWithTips];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  }

- (void)viewDidUnload
{
    [self setTipsDisplay:nil];
    [self setTotalDisplay:nil];
    [self setTaxDisplay:nil];
    [self setTipsDisplay:nil];
    [self setTipsBeforeTaxDisplay:nil];
    [self setTipsDisplay:nil];
    [self setTotalAfterTipsDisplay:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
