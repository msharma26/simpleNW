//
//  MSHPostParameter.m
//  SimpleNW
//
//  Created by Manu Sharma on 7/18/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import "MSHPostParameter.h"

@implementation MSHPostParameter

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTextViews];
    }
    return self;
}

-(void) layoutSubviews{
    
    
}


-(void) createTextViews{
    self.keyField = [[UITextField alloc] initWithFrame:CGRectMake(0,0,self.frame.size.width/2, self.frame.size.height)];
    self.valField = [[UITextField alloc] initWithFrame:CGRectMake(0,self.frame.size.width/2,self.frame.size.width/2, self.frame.size.height)];
    
    [self.keyField setBorderStyle:UITextBorderStyleNone];
    [self.valField setBorderStyle:UITextBorderStyleNone];
}

@end
