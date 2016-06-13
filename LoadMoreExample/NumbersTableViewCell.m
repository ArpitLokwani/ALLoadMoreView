//
//  NumbersTableViewCell.m
//  LoadMoreExample
//
//  Created by Arpit Lokwani  on 6/10/16.
//  Copyright © 2016 Arpit Lokwani . All rights reserved.
//

#import "NumbersTableViewCell.h"

@implementation NumbersTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier deviceFrame:(CGRect)frame {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = frame;
        [self setObjects];
    }
    return self;
}

- (void)setObjects {
    self.numbersLabel = [[UILabel alloc] init];
    self.numbersLabel.frame = CGRectMake(0, 0, self.frame.size.width, 40);
    self.numbersLabel.font = [UIFont boldSystemFontOfSize:32.0];
    self.numbersLabel.textColor = [UIColor orangeColor];
    self.numbersLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.numbersLabel];
}

@end
