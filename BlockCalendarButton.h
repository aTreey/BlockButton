//
//  BlockCalendarButton.h
//  HealthGuard
//
//  Created by LaoTao on 15/6/2.
//  Copyright (c) 2015年 LaoTao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockCalendarButton : UIButton

@property (copy, nonatomic) NSString *textStr;
@property (strong, nonatomic) NSDate *dateTime;     //日期
@property (copy, nonatomic) NSString *dateStr; //日期

- (void)setClickBlock:(void (^)(BlockCalendarButton *))clickedBlock;

- (void)setButtonTitleWithAttributedString:(NSAttributedString *)title;
- (void)setButtonTitleWithTitle:(NSString *)title;

@end
