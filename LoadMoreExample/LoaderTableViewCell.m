//
//  LoaderTableViewCell.m
//  
//
//  Created by Arpit Lokwani .S on 05/06/15.
//  Copyright (c) 2015 Arpit Lokwani . All rights reserved.
//

#import "LoaderTableViewCell.h"

@implementation LoaderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = NO;
        self.loadMoreIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        self.loadMoreIndicator.hidesWhenStopped = YES;
        [self.contentView addSubview:self.loadMoreIndicator];
        
        self.statusLabel = [[UILabel alloc] init];
        self.statusLabel.hidden = YES;
        self.statusLabel.text = @"No more products";
        self.statusLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0f];
        self.statusLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.statusLabel];
    }
    return self;
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    
    self.loadMoreIndicator.center = CGPointMake(self.contentView.bounds.size.width/2, self.contentView.bounds.size.height/2);
    self.statusLabel.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
