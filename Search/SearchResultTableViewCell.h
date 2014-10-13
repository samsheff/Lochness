//
//  SearchResultTableViewCell.h
//  Search
//
//  Created by Sam Sheffres on 10/13/14.
//  Copyright (c) 2014 Sam Sheffres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionView;
@property (strong, nonatomic) IBOutlet UILabel *urlLabel;

@end
