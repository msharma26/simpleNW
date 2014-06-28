//
//  MSHSettingsVC.m
//  SimpleNW
//
//  Created by Manu Sharma on 6/27/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import "MSHSettingsVC.h"

@interface MSHSettingsVC ()
@property (nonatomic, weak) IBOutlet UITextField *txtFieldURL;
@property (nonatomic, weak) IBOutlet UIButton *saveButton;
-(IBAction) btnActionSave: (id) Sender;
@end

@implementation MSHSettingsVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Populating TextField if there is a JSON URL set already.
    if([[NSUserDefaults standardUserDefaults] valueForKey:userDefaultKeyJSON]){
        self.txtFieldURL.text = [[NSUserDefaults standardUserDefaults] valueForKey:userDefaultKeyJSON];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Helper methods
-(IBAction) btnActionSave: (id) Sender{
    [self.txtFieldURL resignFirstResponder];
    if(self.txtFieldURL!=nil){
        [[NSUserDefaults standardUserDefaults] setValue:self.txtFieldURL.text forKey:userDefaultKeyJSON];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
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

@end
