//
//  MSHKeyboardListener.h
//  SimpleNW
//
//  Created by Manu Sharma on 6/28/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSHKeyboardListener : NSObject{

}

+ (MSHKeyboardListener*) shared;
@property (nonatomic) BOOL visible;
@end
