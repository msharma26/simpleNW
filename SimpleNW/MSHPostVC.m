//
//  MSHPostVC.m
//  SimpleNW
//
//  Created by Manu Sharma on 6/28/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import "MSHPostVC.h"
#import "MSHKeyboardListener.h"
#import "AFNetworking.h"
#import "MSHPostResponseVC.h"
#import "MSHAddKeysVC.h"
#import "MSHParameterCell.h"


#define BaseURLString @"http://manusharma.me"

@interface MSHPostVC ()<UITextFieldDelegate, MSHAddKeysDelegate, UITableViewDataSource, UITableViewDelegate>

// Parameter count
@property (nonatomic) NSInteger keyCount;

@property (nonatomic, strong) MSHKeyboardListener *keyboardListener;
@property (nonatomic, strong) NSMutableDictionary *responseDictionary;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollViewMain;

@property (nonatomic, strong)MSHPostResponseVC *destViewController;

// IBActions
-(IBAction) btnActionSendRequest:(id)sender;
-(IBAction) btnActionAddKeys:(id) sender;


@property (nonatomic, strong) MSHAddKeysVC *vc;

@end

@implementation MSHPostVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


static NSString *paramCellID = @"parameterCell";


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Registering the Cell
    // Registering the nib and hence the class
    UINib *cellNib = [UINib nibWithNibName:@"MSHParameterCell" bundle:nil];
    [self.parameterTable registerNib:cellNib forCellReuseIdentifier:paramCellID];

    
    //[self jsonTapped];
    self.keyboardListener = [MSHKeyboardListener shared];
    
    // Setting initial parameter count = 3
    self.keyCount = 3;
    
    //self.vc.delegateFTW = self;
    


}

-(void) viewDidLayoutSubviews{
    [self.scrollViewMain setContentSize:CGSizeMake(320,self.view.frame.size.height+ 64+44)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



-(void) createTextViewsForPairs: (NSInteger) keyValuePairCount{
    for (int i=0; i<keyValuePairCount; i++){
        
    }
}


-(void) jsonTapped
{
    // 0.5 Creating weak references
    __weak id weakself = self;
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"username": @"msharma",
                             @"password": @"Avinash1",
                             @"returnType": @"json"
                             };
    [manager POST:@"http://manusharma.me/login/check_login.php"
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              [[weakself responseDictionary] setDictionary:(NSDictionary*) responseObject];

              NSLog(@"JSON: %@", responseObject);
              
              
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error);
    }];
}


-(void) resizeScrollView{
 //   if(self.keyboardListener.visible){
        self.scrollViewMain.frame = CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width, self.view.frame.size.height-270);
   // }
}


#pragma mark - TextField Delegate

-(void) textFieldDidBeginEditing:(UITextField *)textField{
    self.scrollViewMain.frame = CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width, self.view.frame.size.height-216+64);
    
    if(textField.tag==0){
        
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.scrollViewMain.frame = CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width, self.view.frame.size.height);

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    self.scrollViewMain.frame = CGRectMake(self.view.frame.origin.x,self.view.frame.origin.y,self.view.frame.size.width, self.view.frame.size.height);

    [textField resignFirstResponder];
        return YES;
}

#pragma mark - storyboard navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SeguePostResponse"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.destViewController = segue.destinationViewController;
        
        
    }
    
    if([segue.identifier isEqualToString:@"AddKeysSegue"]){
        self.vc = (MSHAddKeysVC*)segue.destinationViewController;
        self.vc.keysCount = self.keyCount;
        
    }
}


-(void) performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    self.destViewController.responseDictionary = self.responseDictionary;
}



#pragma mark - IBActions

-(IBAction)btnActionSendRequest:(id)sender{
    //[self performSegueWithIdentifier:@"SeguePostResponse" sender:self];
}

-(IBAction)btnActionAddKeys:(id)sender{
    [[self parameterTable] beginUpdates];
        NSArray *paths = [NSArray arrayWithObject:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.parameterTable insertRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationLeft];
    self.keyCount++;
    [self.parameterTable reloadData];
    [[self parameterTable] endUpdates];
}


#pragma mark - Add Keys VC Delegate

-(void) didCancel{
    [self.vc dismissViewControllerAnimated:YES completion:^{
       
    }];
}


#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self keyCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MSHParameterCell *paramsCell = (MSHParameterCell *) [tableView dequeueReusableCellWithIdentifier:paramCellID forIndexPath:indexPath];
    
    if(!paramsCell){
        
    }
    
    return paramsCell;
}


@end
