//
//  TableViewCell.m
//  XML Parser Sample
//
//  Created by Jigar M on 23/07/14.
//  Copyright (c) 2014 Jigar M. All rights reserved.
//


#import "TableViewCell.h"


@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    // ignore the style argument, use our own to override
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
        // If you need any further customization
    }
    return self;
}



@end

