//
//  SearchViewController.m
//  Search
//
//  Created by Sam Sheffres on 12/30/14.
//  Copyright (c) 2014 Sam Sheffres. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {

}
- (void)viewDidAppear:(BOOL)animated {
    
    [UIView animateWithDuration:1.0f delay:0.5f usingSpringWithDamping:0.50f initialSpringVelocity:0.8f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.beardImageView.transform = CGAffineTransformMakeScale(1.2f, 1.2f);
        self.beardImageView.transform =  CGAffineTransformMakeRotation(3.1415926536);
    } completion:^(BOOL finished) {
    }];

    [UIView animateWithDuration:0.9f delay:2.5f usingSpringWithDamping:0.50f initialSpringVelocity:3.5f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.beardImageView.transform = CGAffineTransformScale(self.beardImageView.transform, 1.35f, 1.35f);
        self.logoTextImageView.transform = CGAffineTransformMakeScale(1.65f, 1.35f);
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:1.0f delay:2.6f usingSpringWithDamping:0.75f initialSpringVelocity:1.8f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.beardImageView.transform = CGAffineTransformScale(self.beardImageView.transform, 0.01f, 0.01f);
        self.logoTextImageView.transform = CGAffineTransformScale(self.logoTextImageView.transform, 0.001f, 0.001f);
    } completion:^(BOOL finished) {
        [self performSegueWithIdentifier:@"GoToSearchScene" sender:self];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
