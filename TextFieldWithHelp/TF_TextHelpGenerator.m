//
//  TF_TextHelpGenerator.m
//  TextFieldWithHelp
//
//  Created by Yonathan JM on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TF_TextHelpGenerator.h"
#import <QuartzCore/QuartzCore.h>

@implementation TF_TextHelpGenerator

+(UIImageView*)helperBallonWithText:(NSString *)textString aboveFrame:(CGRect)tfFrame heightSpacing:(float)hSpace alpha:(float)aPoint
{
    //setting the label inside the balloon
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tfFrame.size.width, tfFrame.size.height*5)];
    [textLabel setText:textString];
    [textLabel setNumberOfLines:0];
    [textLabel setTextColor:[UIColor whiteColor]];
    [textLabel setBackgroundColor:[UIColor clearColor]];
    [textLabel setTextAlignment:UITextAlignmentCenter];
    [textLabel sizeToFit];
    CGRect labelFrame = textLabel.frame;
    
    //setting an imageView to contain the label and provide the balloon shape
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,  labelFrame.size.width+20, labelFrame.size.height+10)];
    [imgView addSubview:textLabel];
    [imgView.layer setCornerRadius:10.0];
    [imgView setClipsToBounds:YES];
    [imgView setAlpha:aPoint];
    CGRect imgFrame = imgView.frame;
    
    //change this if u want a different balloon
    UIImage *image = [[UIImage imageNamed:@"dot.png"]stretchableImageWithLeftCapWidth:imgFrame.size.width topCapHeight:imgFrame.size.height];
    [imgView setImage:image];

    //reposition the text label so that it fits at the center of the balloon
    [textLabel setCenter:CGPointMake(imgFrame.size.width/2, imgFrame.size.height/2)];
    
    //change this if u want a different balloon
    image = [UIImage imageNamed:@"baloonArrow.png"];
    
    //setting the master imageview that contain all the balloon parts
    UIImageView *masterView = [[UIImageView alloc]initWithFrame:CGRectMake(tfFrame.origin.x+tfFrame.size.width-(labelFrame.size.width+20), tfFrame.origin.y-(imgFrame.size.height+image.size.height+hSpace),  imgFrame.size.width, imgFrame.size.height)];
    [masterView addSubview:imgView];
    
    UIImageView *imgArrow = [[UIImageView alloc]initWithFrame:CGRectMake(masterView.frame.size.width-(masterView.frame.size.width/3), masterView.frame.size.height, image.size.width, image.size.height)];
    [imgArrow setImage:image];
    [imgArrow setAlpha:aPoint];
    
    [masterView addSubview:imgArrow];
    
    
    return masterView;
}


@end
