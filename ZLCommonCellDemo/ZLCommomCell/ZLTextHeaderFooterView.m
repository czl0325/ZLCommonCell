//
//  ZLTextHeaderFooterView.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/13.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ZLTextHeaderFooterView.h"
#import "Masonry.h"

@implementation ZLTextHeaderFooterView

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
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.leftLabel];
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(10);
    }];
    
    [self.contentView addSubview:self.rightImageView];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(12, 16));
    }];
    
    [self.contentView addSubview:self.rightLabel];
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.rightImageView.mas_left).offset(-8);
    }];
}

- (void)setRightImageHide:(BOOL)hidden {
    self.rightImageView.hidden = hidden;
    [self.rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        if (self.rightImageView.isHidden) {
            make.right.mas_equalTo(-10);
        } else {
            make.right.mas_equalTo(self.rightImageView.mas_left).offset(-8);
        }
    }];
}

- (UILabel*)leftLabel {
    if (!_leftLabel) {
        _leftLabel = ({
            UILabel* object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:14];
            object;
        });
    }
    return _leftLabel;
}

- (UILabel*)rightLabel {
    if (!_rightLabel) {
        _rightLabel = ({
            UILabel* object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:14];
            object.textAlignment = NSTextAlignmentRight;
            object;
        });
    }
    return _rightLabel;
}

- (UIImageView*)rightImageView {
    if (!_rightImageView) {
        _rightImageView = ({
            UIImageView* object = [[UIImageView alloc]init];
            object.contentMode = UIViewContentModeScaleAspectFill;
            object.clipsToBounds = YES;
            object.image = [UIImage imageNamed:@"zl_arrow_right"];
            object;
        });
    }
    return _rightImageView;
}

@end
