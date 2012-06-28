//
//  TFViewController.m
//  TextFieldWithHelp
//
//  Created by Yonathan JM on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TFViewController.h"
#import "TF_TextHelpGenerator.h"
#import <QuartzCore/QuartzCore.h>


UITextField *tField1,*tField2,*tField3;
UIImageView *helpImage;

@implementation TFViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{    
    tField1 = [[UITextField alloc]initWithFrame:CGRectMake(25, 100, self.view.frame.size.width-50, 40)];
    [tField1 setBorderStyle:UITextBorderStyleRoundedRect];
    [tField1 setDelegate:self];
    [tField1 setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.view addSubview:tField1];
    
    tField2 = [[UITextField alloc]initWithFrame:CGRectMake(25, 200, self.view.frame.size.width-50, 40)];
    [tField2 setBorderStyle:UITextBorderStyleRoundedRect];
    [tField2 setDelegate:self];
    [tField2 setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.view addSubview:tField2];
    
    tField3 = [[UITextField alloc]initWithFrame:CGRectMake(25, 300, self.view.frame.size.width-50, 40)];
    [tField3 setBorderStyle:UITextBorderStyleRoundedRect];
    [tField3 setDelegate:self];
    [tField3 setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.view addSubview:tField3];
    
    UITapGestureRecognizer *tapMe = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tapMe];
    
    [super viewDidLoad];
}

-(void)hideKeyboard
{
    [helpImage removeFromSuperview];
    [tField1 resignFirstResponder];
    [tField2 resignFirstResponder];
    [tField3 resignFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (NSTimeInterval)keyboardAnimationDurationForNotification:(NSNotification*)notification
{
    NSDictionary* info = [notification userInfo];
    NSValue* value = [info objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval duration = 0;
    [value getValue:&duration];
    return duration;
}

#pragma mark - delegation
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSString *helpString;
    if (textField == tField1) helpString = @"masukkan username yang anda inginkan, huruf / abjad";
    else if (textField == tField2) helpString = @"masukkan password, huruf dan abjad, minimal 8 karakter, tanpa spasi";
    else if (textField == tField3) helpString = @"ulang password anda";
    
    [helpImage removeFromSuperview];
    helpImage = [TF_TextHelpGenerator helperBallonWithText:helpString aboveFrame:textField.frame heightSpacing:0 alpha:0.75];
    [helpImage setAlpha:0];
    [self.view addSubview:helpImage];
    [UIView animateWithDuration:0.4 animations:^{
        [helpImage setAlpha:1];
    }];
    
    if (textField == tField3) 
    {
        [UIView animateWithDuration:0.3 animations:^{
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [self.view setCenter:CGPointMake(self.view.center.x, self.view.center.y-150)];
        }];
    }
    
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (textField == tField3) 
    {
        [UIView animateWithDuration:0.3 animations:^{
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            [self.view setCenter:CGPointMake(self.view.center.x, self.view.center.y+150)];
        }];
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == tField1)
    {
        [textField resignFirstResponder];
        [tField2 becomeFirstResponder];
    }
    else if (textField == tField2)
    {
        [textField resignFirstResponder];
        [tField3 becomeFirstResponder];
    }
    else if (textField == tField3)
    {
        [textField resignFirstResponder];
        [tField1 becomeFirstResponder];
    }
}

@end
