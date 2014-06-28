//
//  MSHKeyboardListener.m
//  SimpleNW
//
//  Created by Manu Sharma on 6/28/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import "MSHKeyboardListener.h"

@implementation MSHKeyboardListener


+ (MSHKeyboardListener*) shared {
	static MSHKeyboardListener *sListener;
	if ( nil == sListener ) sListener = [[MSHKeyboardListener alloc] init];
    
	return sListener;
}

-(id) init {
	self = [super init];
    
	if ( self ) {
		NSNotificationCenter		 *center = [NSNotificationCenter defaultCenter];
		[center addObserver:self selector:@selector(noticeShowKeyboard:) name:UIKeyboardDidShowNotification object:nil];
		[center addObserver:self selector:@selector(noticeHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
	}
    
	return self;
}

-(void) noticeShowKeyboard:(NSNotification *)inNotification {
	_visible = true;
}

-(void) noticeHideKeyboard:(NSNotification *)inNotification {
	_visible = false;
}

-(BOOL) isVisible {
	return _visible;
}

@end

