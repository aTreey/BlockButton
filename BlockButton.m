//
//  BlockButton.m
//  SearchDevice_Demo
//
//  Created by LaoTao on 15/5/15.
//  Copyright (c) 2015年 LaoTao. All rights reserved.
//

#import "BlockButton.h"

@interface BlockButton ()

@property(copy,nonatomic) void (^buttonClicked)(UIButton *button);

@end

@implementation BlockButton
{
    UILabel *_nameLabel;
    UILabel *_label;
}

- (void)setClickBlock:(void (^)(BlockButton *))clickedBlock {
    [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    _buttonClicked = [clickedBlock copy];
}

- (void)buttonPressed:(UIButton *)button {
//    button.selected = !button.selected;
    self.buttonClicked(button);
}


/*s// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
