//
//  NumbersTableViewCell.h
//  LoadMoreExample
//
//  Created by Arpit Lokwani  on 6/10/16.
//  Copyright © 2016 Arpit Lokwani . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumbersTableViewCell : UITableViewCell {
    
}
@property (nonatomic, strong) UILabel *numbersLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier deviceFrame:(CGRect)frame;

@end
