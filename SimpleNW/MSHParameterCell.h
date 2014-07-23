//
//  MSHParameterCell.h
//  SimpleNW
//
//  Created by Manu Sharma on 7/22/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSHParameterCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *keyName;
@property (weak, nonatomic) IBOutlet UITextField *valueName;

-(IBAction)btnActionDelete:(id)sender;
@end
