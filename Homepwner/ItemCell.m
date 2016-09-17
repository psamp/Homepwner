//
//  ItemCell.m
//  Homepwner
//
//  Created by Princess Sampson on 9/17/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

-(void)updateLabels {
    UIFont *bodyFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.nameLabel.font = bodyFont;
    self.valueLabel.font = bodyFont;
    
    UIFont *captionFont = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    self.serialNumberLabel.font = captionFont;
}

@end
