//
//  OverlayView.m
//  calculator
//
//  Created by Blue Fantail on 10/7/13.
//  Copyright (c) 2013 Blue Fantail. All rights reserved.
//

#import "OverlayView.h"

@implementation OverlayView {
    NSMutableArray *interactions;
}
@synthesize divideButton;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (IBAction)divideButton:(id)sender {
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touched");
    UIView* view = [self hitTest: [[touches anyObject] locationInView: self] withEvent: nil];
	if (view != nil && view != self) {
		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"success" message:@"a" delegate:self cancelButtonTitle:@"ca" otherButtonTitles:nil, nil];
        [a show];
	}
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
        NSLog(@"touched");
    UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"success" message:@"a" delegate:self cancelButtonTitle:@"ca" otherButtonTitles:nil, nil];
    [a show];
    UIView* view = [self hitTest: [[touches anyObject] locationInView: self] withEvent: nil];
	if (view != nil && view != self) {
		UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"success" message:@"a" delegate:self cancelButtonTitle:@"ca" otherButtonTitles:nil, nil];
        [a show];	}
}
@end
