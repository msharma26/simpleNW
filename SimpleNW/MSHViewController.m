//
//  MSHViewController.m
//  SimpleNW
//
//  Created by Manu Sharma on 6/26/14.
//  Copyright (c) 2014 WesterLime. All rights reserved.
//

#import "MSHViewController.h"
#import "AFNetworking.h"

#define BaseURLString @"http://manusharma.me"
#define jsonURLImageApp @"http://localhost/myImageApp/index.php"

@interface MSHViewController ()
@property (nonatomic, strong) NSMutableDictionary *jsonDict;
@property (nonatomic, weak) IBOutlet UITextView *tvJSON;
@end

@implementation MSHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initializing ptoperties
    self.jsonDict = [[NSMutableDictionary alloc] init];
    [self jsonTapped];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - helper methods

//- (IBAction)jsonTapped:(id)sender
-(void) jsonTapped
{
    // 0.5 Creating weak references
    __weak id weakself = self;
    
    
    // 1
    NSString *string = [NSString stringWithFormat:@"%@/pawnu", BaseURLString];
    //NSURL *url = [NSURL URLWithString:string];
    NSURL *url;
    if([[NSUserDefaults standardUserDefaults] valueForKey:userDefaultKeyJSON]!=nil){
        url = [NSURL URLWithString:[[NSUserDefaults standardUserDefaults] valueForKey:userDefaultKeyJSON]];
    }
    else{
        url=[NSURL URLWithString:string];
    }
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        // 3

        
        //[self.tableView reloadData];
        [_tvJSON setText: [NSString stringWithFormat:@"%@", responseObject]];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];
}




-(void) readJSON2{
    
    
    NSMutableArray *theReturnArray = [[NSMutableArray alloc] init];
    //__block NSMutableArray *imgNameArray = [[NSMutableArray alloc] init];
    
    //__weak NSMutableArray *theWeakArray = self.imageURLArray;
    
    NSURL *theBaseURL = [NSURL URLWithString:jsonURLImageApp];
    //    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:theBaseURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:theBaseURL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer=  [AFJSONResponseSerializer serializer];
    
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *json = (NSDictionary*) responseObject;
        
        NSMutableArray *imgArrayLocal = [[NSMutableArray alloc] init];
        for (int i = 0; i<[json count]; i++){
            
            [imgArrayLocal addObject: [NSString stringWithFormat:@"%@/%@", jsonURLImageApp, [responseObject[i] objectForKey:@"name"]]];
            
        }
        
        NSLog(@"%@", responseObject);
    }
                              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                  NSLog(@"%@", error);
                              }];
    
    [op start];
    //theWeakArray = imgNameArray;
    //theReturnArray = imgNameArray;
    //return theReturnArray;
}


@end
