//
//  MSHCustomButton.m
//  SimpleNW
//
//  Created by Manu Sharma on 6/30/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import "MSHCustomButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation MSHCustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createButton];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createButton];
    }
    return self;
    
}
-(void) createButton{
    
    
    
    [self initialValues];
    
    switch (self.theButtonType){
            
        case solid:
            self.backgroundColor = self.colorSolidBG;
            [self setTitleColor:self.colorSolidText forState:self.state];
            break;
            
        case hollow:
            self.backgroundColor = [UIColor clearColor];
            self.layer.borderWidth = 0.5f;
            self.layer.borderColor = self.colorHollowBorder.CGColor;
            self.layer.borderColor  = self.colorHollowBorder.CGColor;
            [self setTitleColor:self.colorHollowText forState:self.state];
            break;
            
        default:
            self.backgroundColor = [UIColor greenColor];
            [self setTitleColor:[UIColor whiteColor ] forState:self.state];
            break;
    }

}


-(void) initialValues{
    self.colorSolidBG = [UIColor grayColor];
    self.colorSolidText = [UIColor whiteColor];
    self.colorHollowBorder = [UIColor grayColor];
    self.colorHollowText = [UIColor grayColor];

    self.layer.cornerRadius = 4.0f;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
