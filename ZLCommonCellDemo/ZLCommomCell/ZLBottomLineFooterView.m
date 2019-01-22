//
//  ZLBottomLineCell.m
//  ActionSheetPicker-3.0
//
//  Created by zhaoliang chen on 2019/1/4.
//

#import "ZLBottomLineFooterView.h"
#import "Masonry.h"

@interface ZLBottomLineFooterView()

@end

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
    [self.contentView addSubview:self.centerLabel];
    [self.centerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.leftLine];
    [self.leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.centerLabel.mas_left).offset(-10);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(100);
    }];
    
    [self.contentView addSubview:self.rightLine];
    [self.rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leftLine);
        make.left.mas_equalTo(self.centerLabel.mas_right).offset(10);
        make.size.mas_equalTo(self.leftLine);
    }];
}

- (UILabel*)centerLabel {
    if (!_centerLabel) {
        _centerLabel = [[UILabel alloc]init];
        if (@available(iOS 6.0, *)) {
            _centerLabel.textAlignment = NSTextAlignmentCenter;
        }
        _centerLabel.font = [UIFont systemFontOfSize:14];
        _centerLabel.textColor = [UIColor grayColor];
        _centerLabel.text = @"我是有底线的";
    }
    return _centerLabel;
}


- (UIView *)leftLine{
    if(!_leftLine){
        _leftLine = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1.0];
            object;
       });
    }
    return _leftLine;
}

- (UIView *)rightLine{
    if(!_rightLine){
        _rightLine = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor colorWithRed:170.0/255 green:170.0/255 blue:170.0/255 alpha:1.0];
            object;
       });
    }
    return _rightLine;
}
@end
