//
//  WebViewController.h
//  Search
//
//  Created by Sam Sheffres on 10/13/14.
//  Copyright (c) 2014 Sam Sheffres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *url;

@end
