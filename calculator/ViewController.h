//
//  ViewController.h
//  calculator
//
//  Created by Blue Fantail on 10/1/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSPopoverView.h"

typedef enum{ Plus,Minus,Multiply,Divide} CalcOperation;

@interface ViewController : UIViewController <KSPopoverViewDelegate> {
    IBOutlet UILabel *display;
    NSString *storedValue;
//    CalcOperation operation;
    NSString *operation;
    KSPopoverView *_menu;
}
@property (weak, nonatomic) IBOutlet UIButton *keypadButton;

- (IBAction)digitButton:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;
- (IBAction)equalButtonPressed:(UIButton *)sender;
- (IBAction)clearButtonPressed:(UIButton *)sender;

@end
