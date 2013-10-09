//
//  ViewController.h
//  calculator
//
//  Created by Blue Fantail on 10/1/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{ Plus,Minus,Multiply,Divide} CalcOperation;

@interface ViewController : UIViewController {
    IBOutlet UILabel *display;
    NSString *storedValue;
//    CalcOperation operation;
    NSString *operation;
    
    
}
@property (weak, nonatomic) IBOutlet UIButton *keypadButton;
@property (strong, nonatomic) UIView *subview;
@property (weak, nonatomic) UIGestureRecognizer *gesture;

- (IBAction)digitButton:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
- (IBAction)equalButtonPressed:(UIButton *)sender;
- (IBAction)clearButtonPressed:(UIButton *)sender;

@end
