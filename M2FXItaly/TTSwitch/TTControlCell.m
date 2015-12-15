//
//  TTControlCell.m
//  TTSwitch
//
//  Created by Scott Penrose on 12/5/12.
//  Copyright (c) 2012 Two Toasters. All rights reserved.
//

#import "TTControlCell.h"

#import "TTControlItem.h"
#import "TTSwitch.h"

@implementation TTControlCell

#pragma mark - Init/Dealloc

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.clipsToBounds = NO;
        self.contentView.clipsToBounds = NO;
        TTSwitch *squareThumbSwitch = [[TTSwitch alloc] initWithFrame:(CGRect){ CGPointZero, { 76.0f, 27.0f } }];
        squareThumbSwitch.passDelegate = self;
        squareThumbSwitch.defel = _test;
        squareThumbSwitch.trackImage = [UIImage imageNamed:@"square-switch-track"];
        squareThumbSwitch.overlayImage = [UIImage imageNamed:@"square-switch-overlay"];
        squareThumbSwitch.thumbImage = [UIImage imageNamed:@"square-switch-thumb"];
        squareThumbSwitch.thumbHighlightImage = [UIImage imageNamed:@"square-switch-thumb-highlight"];
        squareThumbSwitch.trackMaskImage = [UIImage imageNamed:@"square-switch-mask"];
        squareThumbSwitch.thumbMaskImage = nil; // Set this to nil to override the UIAppearance setting
        squareThumbSwitch.thumbInsetX = -3.0f;
        squareThumbSwitch.thumbOffsetY = -3.0f;
        self.imageView.image = [UIImage imageNamed:@"set1"];

        self.accessoryView = squareThumbSwitch;
    }
    return self;
}

#pragma mark - Accessors

- (void)setControlItem:(TTControlItem *)controlItem
{
    _controlItem = controlItem;
//    self.imageView.image = [UIImage imageNamed:@"set1"];
    self.textLabel.text = _controlItem.title;
    
    self.accessoryView = _controlItem.control;
}

#pragma mark - UITableView Helpers


+ (NSString *)cellIdentifier
{
    return @"tt.switch.control.cellIdentifier";
}

@end
