//
//  BlockSearchButton.h
//  HealthGuard
//
//  Created by LaoTao on 15/6/2.
//  Copyright (c) 2015年 LaoTao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockSearchButton : UIButton

@property (strong, nonatomic) UIImageView *statusImageView;

// 蓝牙搜索周边设备。显示设备图片，以及name的方法
- (id)initWithFrame:(CGRect)frame
          imageName:(NSString *)imageName
  selectedImageName:(NSString *)selectedImageName
              title:(NSString *)title
       clickedBlock:(void (^)(BlockSearchButton *button))clickedBlock;

@end
