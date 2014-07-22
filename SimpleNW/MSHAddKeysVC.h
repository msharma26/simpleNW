//
//  MSHAddKeysVC.h
//  SimpleNW
//
//  Created by Manu Sharma on 7/18/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MSHAddKeysDelegate <NSObject>

@optional
-(void) didCancel;

@end


@interface MSHAddKeysVC : UIViewController

@property (nonatomic) NSInteger keysCount;
@property (nonatomic, strong) NSDictionary* keyPair;

@property (nonatomic, weak) id <MSHAddKeysDelegate> delegateFTW;

@end
