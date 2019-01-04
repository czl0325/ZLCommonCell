//
//  ZLBottomLineCell.m
//  ActionSheetPicker-3.0
//
//  Created by zhaoliang chen on 2019/1/4.
//

#import "ZLBottomLineFooterView.h"
#import "Masonry.h"

@implementation ZLBottomLineFooterView

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
    [self.contentView addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.contentView);
    }];
    
    UIView* line1 = [[UIView alloc]init];
    line1.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.textLabel.mas_left).offset(-10);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(100);
    }];
    
    UIView* line2 = [[UIView alloc]init];
    line2.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(line1);
        make.left.mas_equalTo(self.textLabel.mas_right).offset(10);
        make.size.mas_equalTo(line1);
    }];
}

- (UILabel*)textlabel {
    if (!_textlabel) {
        _textlabel = [[UILabel alloc]init];
        if (@available(iOS 6.0, *)) {
            _textlabel.textAlignment = NSTextAlignmentCenter;
        }
        _textlabel.font = [UIFont systemFontOfSize:14];
        _textlabel.textColor = [UIColor grayColor];
        _textlabel.text = @"我是有底线的";
    }
    return _textlabel;
}

@end
