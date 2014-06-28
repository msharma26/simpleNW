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

#define BaseURLString @"http://manusharma.me"

@interface MSHPostVC ()

@end

@implementation MSHPostVC

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
    [self jsonTapped];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

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
              NSLog(@"JSON: %@", responseObject);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error);
    }];
}

//
//-(void) jsonTapped2
//{
//    // 0.5 Creating weak references
//    __weak id weakself = self;
//    
//    
//    // 1
//    NSString *string = [NSString stringWithFormat:@"%@/login", BaseURLString];
//    //NSURL *url = [NSURL URLWithString:string];
//    NSURL *url=[NSURL URLWithString:string];
//
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    NSDictionary *params = @{@"username": @"msharma",
//                             @"password": @"Avinash1"};
//
//    
//    // 2
//    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
//    operation.responseSerializer = [AFJSONResponseSerializer serializer];
//    
//    [operation POST:@"http://manusharma/login"
//       parameters:params
//          success:^(AFHTTPRequestOperation *operation, id responseObject) {
//              NSLog(@"JSON: %@", responseObject);
//          }
//          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//              NSLog(@"Error: %@", error);
//          }];
//
//    // 5
//    [operation start];
//}




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
