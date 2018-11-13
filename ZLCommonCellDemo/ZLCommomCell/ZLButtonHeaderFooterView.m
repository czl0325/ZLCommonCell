//
//  ZLButtonHeaderFooterView.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/13.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ZLButtonHeaderFooterView.h"
#import "Masonry.h"

@implementation ZLButtonHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

- (void)onClickButton {
    if (self.onTouchButton) {
        self.onTouchButton();
    }
}

- (UIButton*)button {
    if (!_button) {
        _button = ({
            UIButton* object = [UIButton buttonWithType:UIButtonTypeCustom];
            object.backgroundColor = [UIColor orangeColor];
            object.layer.cornerRadius = 5;
            [object setTitle:@"提交" forState:UIControlStateNormal];
            [object setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [object addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
            object;
        });
    }
    return _button;
}

@end
