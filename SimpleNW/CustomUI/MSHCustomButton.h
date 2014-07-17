//
//  MSHCustomButton.h
//  SimpleNW
//
//  Created by Manu Sharma on 6/30/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    solid=0,
    hollow
}ButtonType;

@interface MSHCustomButton : UIButton
@property (nonatomic, readwrite) ButtonType theButtonType;

// Solid Button
@property (nonatomic, strong) UIColor *colorSolidBG;
@property (nonatomic, strong) UIColor *colorSolidText;

// hollow button
@property (nonatomic, strong) UIColor *colorHollowBorder;
@property (nonatomic, strong) UIColor *colorHollowText;

@end
