//
//  MSHLeftTableVC.m
//  SimpleNW
//
//  Created by Manu Sharma on 7/10/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import "MSHLeftTableVC.h"
#import "MSHiPadRootVC.h"
#import "MSHViewController.h"

@class MSHSettingsVC;

@interface MSHLeftTableVC ()<UITableViewDataSource, UITableViewDelegate, UISplitViewControllerDelegate>
@property (nonatomic, strong) MSHiPadRootVC *rootVC;
@property (nonatomic, strong) NSMutableArray *masterDetailVCs;
@end

@implementation MSHLeftTableVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.navigationController setNavigationBarHidden:YES];
    self.masterDetailVCs = [[NSMutableArray alloc] initWithArray:self.splitViewController.viewControllers];
}

-(void) awakeFromNib{
    UIColor *blurGreen = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blur_green.jpg"]];
    [self.splitViewController.view setBackgroundColor:blurGreen];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{


    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat rowHeight;
    switch (indexPath.row){
        case 0 : rowHeight = 200.00f;
            break;
        case 1: rowHeight = 80.0f;
            break;
        case 2: rowHeight = 80.0f;
            break;
        default: rowHeight = 80.0f;
            break;
    }
    
    return rowHeight;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    UIImageView *img = [[UIImageView alloc] init];
    switch(indexPath.row){
        case 0:


            break;
        case 1: cell.textLabel.text = @"HTTP";
            break;
        case 2: cell.textLabel.text = @"POST";
            break;
        default:break;
    }
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqual:@"SettingsSegue"]){
        
    }
}


#pragma mark - Table View Delegate Bitches!

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.rootVC = [[MSHiPadRootVC alloc] init];
    //UINavigationController *navController = (UINavigationController*) self.splitViewController.childViewControllers[1];
    UIStoryboard *iPadStory = [UIStoryboard storyboardWithName:@"Main_iPad" bundle: nil];
    UIViewController *httpVC = (UIViewController*) [iPadStory instantiateViewControllerWithIdentifier:@"DetailHTTPNavController"];
    //self.masterDetailVCs[1] =
    switch(indexPath.row){
        case 0:
            NSLog(@"Header clicked");
            break;
            
        case 1:
            self.masterDetailVCs[1] = httpVC;
            self.splitViewController.viewControllers = self.masterDetailVCs;
            break;
            
        case 2:
            break;
        default:break;
    }

}

@end
