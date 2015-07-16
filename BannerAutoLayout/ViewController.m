//
//  ViewController.m
//  BannerAutoLayout
//
//  Created by Erika Washburn on 7/15/15.
//  Copyright (c) 2015 ARC. All rights reserved.
//

#import "ViewController.h"

@import FBAudienceNetwork;

@interface ViewController () <FBAdViewDelegate>

@property(nonatomic, weak) UIView *banner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *banner = [[UIView alloc] init];
    banner.backgroundColor = [UIColor redColor];
    self.banner = banner;
    [self.view addSubview:banner];

    FBAdView *fbAdView =[[FBAdView alloc] initWithPlacementID:@"YOUR_PLACEMENT_ID"
                                                       adSize:kFBAdSizeHeight50Banner
                                           rootViewController:self];
    fbAdView.delegate = self;
    [fbAdView loadAd];
    [self.banner addSubview:fbAdView];

    //

    self.banner.translatesAutoresizingMaskIntoConstraints = NO;
    fbAdView.translatesAutoresizingMaskIntoConstraints = NO;


    // Width constraint
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.banner
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.view
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1
                                                          constant:0]];

    // Height constraint
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[banner(==50)]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(banner)]];

    //

    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem:fbAdView
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.banner
                                                            attribute:NSLayoutAttributeWidth
                                                           multiplier:1
                                                             constant:0]];

    // Height constraint, parent view height
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem:fbAdView
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.banner
                                                            attribute:NSLayoutAttributeHeight
                                                           multiplier:1
                                                             constant:0]];

    // Center horizontally
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem:fbAdView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.banner
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1.0
                                                             constant:0.0]];

    // Center vertically
    [self.banner addConstraint:[NSLayoutConstraint constraintWithItem:fbAdView
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.banner
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1.0
                                                             constant:0.0]];
}

@end
