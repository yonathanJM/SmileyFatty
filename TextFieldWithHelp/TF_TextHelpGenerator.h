//
//  TF_TextHelpGenerator.h
//  TextFieldWithHelp
//
//  Created by Yonathan JM on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TF_TextHelpGenerator : NSObject

+(UIImageView*)helperBallonWithText:(NSString*)textString aboveFrame:(CGRect)tfFrame heightSpacing:(float)hSpace alpha:(float)aPoint;


@end
