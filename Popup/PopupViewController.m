//
//  PopupViewController.m
//  Popup
//
//  Created by Mohamad Sheikh on 6/19/17.
//  Copyright © 2017 Mohamad Sheikh. All rights reserved.
//

#import "PopupViewController.h"

@interface PopupViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIView *popUp;
@property (strong,nonatomic) UIView *backgroundEffect;
@property (weak, nonatomic) IBOutlet UIButton *dismissBut;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property MSAlertType alertType;

@end

static NSString *AlertNibName = @"AlertPopUp";
static NSString *TextFieldNibName = @"TextFieldPopup";

@implementation PopupViewController
+ (instancetype)initWithTitle:(NSString *)title message:(NSString *)message type:(MSAlertType)type {
    PopupViewController *vc = [[PopupViewController alloc] init];
    
    UIView *view;
    switch (type) {
        case Alert:
            view = [[NSBundle mainBundle] loadNibNamed:AlertNibName owner:vc options:0].firstObject;
            break;
        case AlertWithTextField:
            view = [[NSBundle mainBundle] loadNibNamed:TextFieldNibName owner:vc options:0].firstObject;
            break;
        default:
            view = [[NSBundle mainBundle] loadNibNamed:AlertNibName owner:vc options:0].firstObject;
            break;
    }
    vc.alertType = type;
    
    view.layer.cornerRadius = 10;
    view.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    view.layer.shadowRadius = 8;
    view.layer.shadowOpacity = .3;
    
    vc.view = [[UIView alloc] init];
    vc.view.backgroundColor = [UIColor clearColor];
    
    vc.popUp = view;
    
    vc.backgroundEffect = [[UIView alloc] initWithFrame:vc.view.frame];
    vc.backgroundEffect.backgroundColor = [UIColor clearColor];
    vc.backgroundEffect.alpha = 0.0;
    
    [vc.view addSubview:vc.backgroundEffect];
    [vc.view addSubview:vc.popUp];
    
    [UIView setAnimationsEnabled:NO];
    vc.providesPresentationContextTransitionStyle = YES;
    vc.definesPresentationContext = YES;
    [vc setModalPresentationStyle:UIModalPresentationOverCurrentContext];

    vc.textLabel.text = message;
    
    return vc;
}
- (void)dismiss {
    [UIView animateWithDuration:.3 animations:^{
        self.popUp.alpha = 0.0;
        self.popUp.transform = CGAffineTransformMakeScale(0.9, 0.9);
        self.backgroundEffect.alpha = 0.0;
        self.backgroundEffect.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:nil];
    }];
}
- (void)setAlertFont:(UIFont *)font {
    self.textLabel.font = [UIFont fontWithName:font.fontName size:16];
    self.dismissBut.titleLabel.font = [UIFont fontWithName:font.fontName size:18];
    self.textField.font = [UIFont fontWithName:font.fontName size:16];
}
- (void)setDismisalButtonTitle:(NSString *)title {
    [self.dismissBut setTitle:title forState:UIControlStateNormal];
}
- (IBAction)okBut:(id)sender {
    [self.textField resignFirstResponder];
    [self dismiss];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.popUp.clipsToBounds = true;
    self.popUp.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.popUp.alpha = 0.0;
    self.popUp.translatesAutoresizingMaskIntoConstraints = false;
    
    if (self.alertType == Alert) {
        [self.popUp.centerXAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerXAnchor].active = true;
        [self.popUp.centerYAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerYAnchor].active = true;
        [self.popUp.heightAnchor constraintGreaterThanOrEqualToConstant:95].active = true;
        [self.popUp.heightAnchor constraintLessThanOrEqualToConstant:295].active = true;
        [self.popUp.widthAnchor constraintEqualToConstant:280].active = true;
    }else if (self.alertType == AlertWithTextField) {
        [self.popUp.centerXAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerXAnchor].active = true;
        [self.popUp.centerYAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerYAnchor constant:-80].active = true;
        [self.popUp.heightAnchor constraintGreaterThanOrEqualToConstant:145].active = true;
        [self.popUp.heightAnchor constraintLessThanOrEqualToConstant:185].active = true;

        [self.popUp.widthAnchor constraintEqualToConstant:280].active = true;
    }
    
    self.backgroundEffect.translatesAutoresizingMaskIntoConstraints = false;
    self.backgroundEffect.transform = CGAffineTransformMakeScale(1.6, 1.6);

    [self.backgroundEffect.centerXAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerXAnchor].active = true;
    [self.backgroundEffect.centerYAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.centerYAnchor].active = true;
    [self.backgroundEffect.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:1.0].active = true;
    [self.backgroundEffect.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:1.0].active = true;

    self.textField.delegate = self;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView setAnimationsEnabled:YES];

    [self.textField becomeFirstResponder];

    [UIView animateWithDuration:.3 animations:^{
        self.backgroundEffect.backgroundColor = [UIColor blackColor];
        self.backgroundEffect.alpha = .3;
        self.backgroundEffect.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.popUp.transform = CGAffineTransformIdentity;
        self.popUp.alpha = 1.0;
    } completion:^(BOOL finished) {
    }];

}
#pragma mark - TextFieldDelegate 
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self dismiss];
    return YES;
}
@end
