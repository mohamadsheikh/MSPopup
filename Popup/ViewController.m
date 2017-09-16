//
//  ViewController.m
//  Popup
//
//  Created by Mohamad Sheikh on 6/19/17.
//  Copyright © 2017 Mohamad Sheikh. All rights reserved.
//

#import "ViewController.h"
#import "PopupViewController.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)popupWithTextField:(id)sender {
    PopupViewController *popup = [PopupViewController initWithTitle:@"Lorem" message:@"Lorem ipsum dolor sit er elit lamet" type:AlertWithTextField];
    [popup setAlertFont:[UIFont fontWithName:@"IRANSans" size:18]];
    [popup setDismisalButtonTitle:@"ok"];
    [self presentViewController:popup animated:YES completion:nil];
}
- (IBAction)messagePopup:(id)sender {
}

@end
