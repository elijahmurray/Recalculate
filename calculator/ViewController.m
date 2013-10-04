//
//  ViewController.m
//  calculator
//
//  Created by Blue Fantail on 10/1/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    BOOL lastButtonPressedWasAnOperation;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	lastButtonPressedWasAnOperation = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitButton:(UIButton *)sender {
    if (lastButtonPressedWasAnOperation == YES) {
        //clear out previous text if it was an operation
        display.text = @"0";
    }
    
    //fringe case for if the text is starting as "0"
    if ([display.text isEqualToString:@"0"]) {
        display.text = sender.currentTitle;
    }
    else {
        display.text = [display.text stringByAppendingString:sender.currentTitle];
    }
    lastButtonPressedWasAnOperation = NO;
}

- (IBAction)operationPressed:(UIButton *)sender {
    
    //store previous value
    storedValue = display.text;
    
    operation = sender.currentTitle;

    NSLog(@"storedValue is %@, and the operation is %@",storedValue, operation);
    lastButtonPressedWasAnOperation = YES;

}

- (IBAction)equalButtonPressed:(UIButton *)sender {
    NSString *secondValue = display.text;
    float sum = 0;
    
    if ([operation isEqualToString:@"+"]) {
        sum = [storedValue floatValue] + [secondValue floatValue];
    }
    else if ([operation isEqualToString:@"-"]) {
        sum = [storedValue floatValue] - [secondValue floatValue];
    }
    else if ([operation isEqualToString:@"/"]) {
        sum = [storedValue floatValue] / [secondValue floatValue];
    }
    else if ([operation isEqualToString:@"*"]) {
        sum = [storedValue floatValue] * [secondValue floatValue];
    }
    
    display.text = [NSString stringWithFormat:@"%f",sum];
    
}

- (IBAction)clearButtonPressed:(UIButton *)sender {
    display.text = @"0";
    storedValue = @"0";
    operation = @"";
}
@end
