//
//  PopupViewController.h
//  Popup
//
//  Created by Mohamad Sheikh on 6/19/17.
//  Copyright © 2017 Mohamad Sheikh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupViewController : UIViewController

typedef NS_OPTIONS(NSUInteger, MSAlertType) {
    Alert = 0,
    AlertWithTextField = 1,
};
+ (instancetype)initWithTitle:(NSString *)title message:(NSString *)message type:(MSAlertType)type;

- (void)setTextFieldText:(NSString *)text;
- (UITextField *)textField;
- (void)setAlertFont:(UIFont *)font;
- (void)setDismisalButtonTitle:(NSString *)title;
@end
