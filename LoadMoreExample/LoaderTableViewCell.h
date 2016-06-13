//
//  LoaderTableViewCell.h
//  
//
//  Created by Arpit Lokwani  on 05/06/15.
//  Copyright (c) 2015 Arpit Lokwani . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoaderTableViewCell : UITableViewCell
@property (nonatomic, strong) UIActivityIndicatorView *loadMoreIndicator;
@property (nonatomic, strong) UILabel *statusLabel;
@end
