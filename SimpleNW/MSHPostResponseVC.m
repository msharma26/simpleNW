//
//  MSHPostResponseVC.m
//  SimpleNW
//
//  Created by Manu Sharma on 6/30/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import "MSHPostResponseVC.h"

@interface MSHPostResponseVC ()
@property (nonatomic, weak) IBOutlet UITextView *txtViewResponse;
@end

@implementation MSHPostResponseVC

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
    self.txtViewResponse.text = (NSString*)self.responseDictionary;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
