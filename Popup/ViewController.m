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
- (IBAction)showPopup:(id)sender {
    PopupViewController *popup = [PopupViewController initWithTitle:@"" message:@"بو نه مستونت بود، فکر زمستونت بود؟" type:AlertWithTextField];
    [popup setAlertFont:[UIFont fontWithName:@"IRANSans" size:18]];
    [popup setDismisalButtonTitle:@"بو نه"];
    [self presentViewController:popup animated:YES completion:nil];
}
@end
