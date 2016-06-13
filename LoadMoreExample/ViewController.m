//
//  ViewController.m
//  LoadMoreExample
//
//  Created by Arpit Lokwani  on 6/10/16.
//  Copyright © 2016 Arpit Lokwani . All rights reserved.
//

#import "ViewController.h"
#import "NumbersTableViewCell.h"
#import "LoaderTableViewCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray *listArray;
    LoaderTableViewCell *_loaderTableViewCell;
    BOOL pullDownRefresh;
    int totalNumbers;
}
@property (nonatomic, strong) UITableView *numbersTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    totalNumbers = 100;
    
    listArray = [[NSMutableArray alloc] init];
    for (int i = 1; i < 30; i++) {
        [listArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    pullDownRefresh = YES;
    self.numbersTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.numbersTableView.delegate = self;
    self.numbersTableView.dataSource = self;
    [self.view addSubview:self.numbersTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return listArray.count;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"NumbersTableViewCell";
        NumbersTableViewCell *cell = (NumbersTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[NumbersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier deviceFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.numbersLabel.text = [listArray objectAtIndex:indexPath.row];
        return cell;
    } else if (indexPath.section == 1) {
        static NSString *loadMore = @"loadMoreIndicator";
        LoaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:loadMore];
        if (cell == nil) {
            cell = [[LoaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:loadMore];
        }
        _loaderTableViewCell = cell;
        return cell;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 50;
    }
    return 30;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSInteger totalRow = [tableView numberOfRowsInSection:indexPath.section];
        if(indexPath.row == totalRow -2 && pullDownRefresh){
            [self performSelector:@selector(loadMoreNumbers) withObject:nil afterDelay:4.0];
        }
    }
    if (indexPath.section == 1) {
        LoaderTableViewCell *lcell = (LoaderTableViewCell *)cell;
        if (pullDownRefresh) {
            lcell.statusLabel.hidden = YES;
            [lcell.loadMoreIndicator startAnimating];
        }else{
            [lcell.loadMoreIndicator stopAnimating];
            lcell.statusLabel.hidden = NO;
        }
    }
}
-(void)loadMoreNumbers {
    int count = (int)listArray.count;
    int taget = count + 10;
    for (int i = count; i < taget; i++) {
        [listArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    if (totalNumbers <= (int)listArray.count) {
        pullDownRefresh = NO;
    } else {
        pullDownRefresh = YES;
    }
  //  pullDownRefresh = YES;// this value based on total products count number and list array count number
    [self.numbersTableView reloadData];
}
@end
