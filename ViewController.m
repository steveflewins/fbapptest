//
//  ViewController.m
//  walky
//
//  Created by Steve Music on 10/25/14.
//  Copyright (c) 2014 Steve Music. All rights reserved.
//

#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (NSString *) shareresult
{
    // only supports passing a single image
    NSArray* images = @[
                        @{@"url": [UIImage imageNamed:@"my-awesome-meal-photo.jpg"], @"user_generated" : @"true" }
                        ];
    
    id<FBOpenGraphAction> action = (id<FBOpenGraphAction>)[FBGraphObject graphObject];
    [action setObject:@"https://example.com/cooking-app/meal/Lamb-Vindaloo.html" forKey:@"meal"];
    [action setObject:images forKey:@"image"];
    
    [FBDialogs presentShareDialogWithOpenGraphAction:action
                                          actionType:@"fbsdktoolkit:cook"
                                 previewPropertyName:@"meal"
                                             handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
                                                 if(error) {
                                                     return @"failed";
                                                 } else {
                                                     return @"worked";
                                                 }
                                             }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    FBLoginView *loginView =
    [[FBLoginView alloc] initWithReadPermissions:
     @[@"public_profile", @"email", @"user_friends"]];
    loginView.delegate = self;
    [FBProfilePictureView class];
    
  //  FBLoginView *loginView = [[FBLoginView alloc] init];
    // Align the button in the center horizontally
    loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), 5);
    [self.view addSubview:loginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// This method will be called when the user information has been fetched

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    self.profilePictureView.profileID = user.id;
    self.nameLabel.text = user.name;
    self.profileidLabel.text = user.id;
}

// Logged-in user experience
- (void)loginViewShowingLoggedInUser:(FBLoginView *)loginView {
    self.statusLabel.text = @"You're logged in as";
}

// Logged-out user experience
- (void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView {
    self.profilePictureView.profileID = nil;
    self.nameLabel.text = @"";
    self.statusLabel.text= @"You're not logged in!";
}

@end
