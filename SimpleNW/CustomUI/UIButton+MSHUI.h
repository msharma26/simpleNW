//
//  UIButton+MSHUI.h
//  SimpleNW
//
//  Created by Manu Sharma on 6/28/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    solid,
    light
}buttonType;

@interface UIButton (MSHUI)
@property (nonatomic) buttonType *buttonType;

// Colors for Hollow Button
@property (nonatomic, strong) UIColor *colorText;
@property (nonatomic, strong) UIColor *colorBorder;

@property (nonatomic, strong) UIColor *colorSolid;

@end
