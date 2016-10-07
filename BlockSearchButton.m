//
//  BlockSearchButton.m
//  HealthGuard
//
//  Created by LaoTao on 15/6/2.
//  Copyright (c) 2015年 LaoTao. All rights reserved.
//

#import "BlockSearchButton.h"

@interface BlockSearchButton ()

@property(copy,nonatomic)void (^buttonClicked)(UIButton *button);

@end

@implementation BlockSearchButton
{
    UILabel *_nameLabel;
    UILabel *_label;
}


//搜索周边设备的方法
- (id)initWithFrame:(CGRect)frame
          imageName:(NSString *)imageName
  selectedImageName:(NSString *)selectedImageName
              title:(NSString *)title
       clickedBlock:(void (^)(BlockSearchButton *button))clickedBlock {
    if (self = [super initWithFrame:frame]) {
        [self uiConfigWithFrame:frame imageName:imageName selectedImageName:selectedImageName title:title];
        
        self.buttonClicked = [clickedBlock copy];
        [self addTarget:self action:@selector(buttonOnClicked:) forControlEvents:UIControlEventTouchUpInside];
    };
    return self;
}

- (void)uiConfigWithFrame:(CGRect)frame
                imageName:(NSString *)imageName
        selectedImageName:(NSString *)selectedImageName
                    title:(NSString *)title
{
    self.frame = frame;
    
    //显示的图片
    self.statusImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, frame.size.width - 2 * 10, frame.size.width - 2 * 10)];
    [self.statusImageView setImage:[UIImage imageNamed:imageName]];
    [self.statusImageView setHighlightedImage:[UIImage imageNamed:selectedImageName]];
    [self addSubview:self.statusImageView];
    
    //显示的文字
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.width - 15, frame.size.width, 15)];
    if (title.length < 1) {
        _nameLabel.text = @"匿名";
    }else {
        _nameLabel.text = title;
    }
    
    _nameLabel.adjustsFontSizeToFitWidth = YES;
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.font = [UIFont systemFontOfSize:14];
    _nameLabel.textColor = k_Color(51, 51, 51);
    [self addSubview:_nameLabel];
}

- (void)buttonOnClicked:(UIButton *)button {
    button.selected = !button.selected;
    self.buttonClicked(button);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
