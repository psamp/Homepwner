//
//  ItemCell.h
//  Homepwner
//
//  Created by Princess Sampson on 9/17/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UITableViewCell
@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;

- (void)updateLabels;
@end
