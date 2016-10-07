//
//  BlockCalendarButton.m
//  HealthGuard
//
//  Created by LaoTao on 15/6/2.
//  Copyright (c) 2015年 LaoTao. All rights reserved.
//

#import "BlockCalendarButton.h"

@interface BlockCalendarButton ()

@property(copy,nonatomic)void (^buttonClicked)(UIButton *button);

@end


@implementation BlockCalendarButton
{
    UILabel *_label;
}

//星期，日历的方法
- (void)uiConfig {
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width / 7, self.frame.size.height)];
    _label.font = k_Font(12);
    _label.textAlignment = NSTextAlignmentCenter;
    _label.numberOfLines = 2;
    _label.lineBreakMode = NSLineBreakByCharWrapping;
    _label.textColor = [UIColor whiteColor];
    [self addSubview:_label];
    
//    [self setBackgroundImage:[UIImage imageNamed:@"blcokBtn_bgImage.png"] forState:UIControlStateNormal];
//    
//    [self setBackgroundImage:[UIImage imageNamed:@"blockBtn_selectedBgImg.png"] forState:UIControlStateSelected];
    
    [self setBackgroundImageColor:[UIColor colorWithHexString:@"#006494"] forState:UIControlStateNormal];
    [self setBackgroundImageColor:[UIColor colorWithHexString:@"#13293d"] forState:UIControlStateSelected];
}

- (void)setDateTime:(NSDate *)dateTime {
    _dateTime = dateTime;
    NSDateFormatter *formatter = [CalendarManager sharedManager].formatter;
    _dateStr = [formatter stringFromDate:dateTime];
}

- (void)setClickBlock:(void (^)(BlockCalendarButton *))clickedBlock {
    [self uiConfig];
    [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonClicked = [clickedBlock copy];
}

- (void)buttonPressed:(UIButton *)button {
    button.selected = !button.selected;
    self.buttonClicked(button);
}

- (void)setButtonTitleWithAttributedString:(NSAttributedString *)title {
    self.textStr = title.string;
    _label.attributedText = title;
    _label.textAlignment = NSTextAlignmentCenter;
}

- (void)setButtonTitleWithTitle:(NSString *)title {
    self.textStr = title;
    _label.text = title;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
