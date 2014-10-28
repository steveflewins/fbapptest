//
//  ViewController.h
//  walky
//
//  Created by Steve Music on 10/25/14.
//  Copyright (c) 2014 Steve Music. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>



@interface ViewController : UIViewController <FBLoginViewDelegate>
@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
@property (strong, nonatomic) IBOutlet UILabel *profileidLabel;

//returns success or failure
- (NSString *) shareresult;

@end

