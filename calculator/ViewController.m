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
    CGPoint touchPoint;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"overlayView" owner:self     options:nil];
    _subview = [subviewArray objectAtIndex:0];
	lastButtonPressedWasAnOperation = NO;
    self.view.backgroundColor = [UIColor colorWithHue:0.0/255.0 saturation:0.0/255.0 brightness:65.0/255.0 alpha:1];
    
//    UIGestureRecognizer *screenPressed = [UIGestureRecognizerStateBegan alloc];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(addSubview:)];
    UIPanGestureRecognizer *fingerPressed = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(addSubview:)];
    
    [self.view addGestureRecognizer:fingerPressed];
    [self.view addGestureRecognizer:longPress];
 
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    // Get the specific point that was touched
    CGPoint point = [touch locationInView:self.view];
    NSLog(@"X location: %f", point.x);
    NSLog(@"Y Location: %f",point.y);
    
}

-(void)addSubview:(UIGestureRecognizer *)gesture {

    CGPoint coords = [gesture locationInView:gesture.view];

    if (gesture.state == UIGestureRecognizerStateBegan) {
        _subview.frame = CGRectMake((coords.x - (_subview.frame.size.width * .5)),(coords.y - (_subview.frame.size.height * .5)), _subview.frame.size.width, _subview.frame.size.height);
        [gesture.view addSubview:_subview];
        NSLog(@"subview showing");
    }
   if (gesture.state == UIGestureRecognizerStateEnded) {
        [_subview removeFromSuperview];
       NSLog(@"subview gone!");
    }
    
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
