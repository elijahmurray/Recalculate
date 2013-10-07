//
//  ViewController.m
//  calculator
//
//  Created by Blue Fantail on 10/1/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import "ViewController.h"


#define PLUS_TAG = 1;
#define MINUS_TAG = 2;
#define DIVIDE_TAG = 3;
#define TIMES_TAG = 4;

@interface ViewController ()  {
    BOOL lastButtonPressedWasAnOperation;

}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	lastButtonPressedWasAnOperation = NO;
    self.view.backgroundColor = [UIColor colorWithHue:0.0/255.0 saturation:0.0/255.0 brightness:65.0/255.0 alpha:1];

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
    
    if (sender.tag == 1) {
        operation = @"+";
    }
    else if (sender.tag == 2) {
        operation = @"-";
    }
    else if (sender.tag == 3) {
        operation = @"/";
    }
    else if (sender.tag == 4) {
        operation = @"*";
    }


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
    
    display.text = [NSString stringWithFormat:@"%g",sum];
    
}

- (IBAction)clearButtonPressed:(UIButton *)sender {
    display.text = @"0";
    storedValue = @"0";
    operation = @"";
}
@end
