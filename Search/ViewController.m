//
//  ViewController.m
//  Search
//
//  Created by Sam Sheffres on 10/13/14.
//  Copyright (c) 2014 Sam Sheffres. All rights reserved.
//

#import "ViewController.h"

#import "WebViewController.h"
#import "SearchResultTableViewCell.h"

int ROW_HEIGHT = 109;

@interface ViewController () <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate> {
    NSArray *_results;
    NSDictionary *_selectedResult;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_searchBar resignFirstResponder];
    [self search];
}

- (void)search
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *searchURL = [NSString stringWithFormat:@"https://arkade.co/search.json?q=%@", [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:searchURL]];
        [request setHTTPMethod:@"GET"];
        
        NSURLResponse *requestResponse;
        NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
        
        if (requestHandler) {
            NSDictionary *jsonResults = [NSJSONSerialization JSONObjectWithData:requestHandler options:kNilOptions error:nil];
            
            _results = jsonResults[@"results"];
        }
        dispatch_async((dispatch_get_main_queue()), ^{
            [self.tableView reloadData];
        });
    });
}

-(NSString*)stringByStrippingHTML:(NSString*)string {
    NSRange r;
    while ((r = [string rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        string = [string stringByReplacingCharactersInRange:r withString:@""];
    return string;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _results.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedResult = (NSDictionary*)_results[indexPath.row];
    [self performSegueWithIdentifier:@"ShowResult" sender:self];
}

- (SearchResultTableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ResultCell"];
    
    NSDictionary *candidate = [_results objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = candidate[@"title"];
    cell.descriptionView.text = [self stringByStrippingHTML:candidate[@"description"]];
    cell.descriptionView.textColor = [UIColor whiteColor];
    cell.urlLabel.text = candidate[@"url"];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual:@"ShowResult"]) {
        WebViewController *vc = [segue destinationViewController];
        vc.url = _selectedResult[@"url"];
    }
}


@end
