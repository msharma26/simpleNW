//
//  MSHAddKeysVC.m
//  SimpleNW
//
//  Created by Manu Sharma on 7/18/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import "MSHAddKeysVC.h"

@interface MSHAddKeysVC ()
- (IBAction)pressCancel:(id)sender;
@end

@implementation MSHAddKeysVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pressCancel:(id)sender {
    
    //UIButton *but1 = (UIButton*)sender;
    
    if ([self.delegateFTW respondsToSelector:@selector(didCancel)]) {
        [self.delegateFTW didCancel];
    }
}


@end
