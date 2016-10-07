//
//  BlockButton.h
//  SearchDevice_Demo
//
//  Created by LaoTao on 15/5/15.
//  Copyright (c) 2015年 LaoTao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockButton : UIButton

//单独设置回调的方法
- (void)setClickBlock:(void (^)(BlockButton *button))clickedBlock;


@end
