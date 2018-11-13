//
//  ZLWrapTextCell.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/13.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ZLWrapTextCell.h"
#import "Masonry.h"

@implementation ZLWrapTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.leftImageView];
        [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(self.contentView);
            make.size.mas_equalTo(25);
        }];
        
        [self.contentView addSubview:self.leftLabel];
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(8).priorityHigh();
            make.centerY.mas_equalTo(self.contentView);
        }];
        
        [self.contentView addSubview:self.rightImageView];
        [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(12, 16));
        }];
        
        [self.contentView addSubview:self.rightLabel];
        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.rightImageView.mas_left).offset(-8);
            make.centerY.mas_equalTo(self.contentView);
            make.left.mas_equalTo(self.leftLabel.mas_right).offset(30);
        }];
        
        [self.leftLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        //[self.rightLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];  //设置水平方向抗压缩优先级高 水平方向可以正常显示
    }
    return self;
}

- (void)setLeftText:(NSString*)text1 rightText:(NSString*)text2 {
    self.leftLabel.text = text1;
    self.rightLabel.text = text2;
    if (text2.length < 1) {
        [self.leftLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.leftImageView.isHidden) {
                make.left.mas_equalTo(10).priorityHigh();
            } else {
                make.left.mas_equalTo(self.leftImageView.mas_right).offset(8).priorityHigh();
            }
            make.centerY.mas_equalTo(self.contentView);
            make.bottom.mas_equalTo(-10);
        }];
        [self.rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.rightImageView.isHidden) {
                make.right.mas_equalTo(-10);
            } else {
                make.right.mas_equalTo(self.rightImageView.mas_left).offset(-8);
            }
            make.centerY.mas_equalTo(self.contentView);
        }];
    } else {
        [self.leftLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.leftImageView.isHidden) {
                make.left.mas_equalTo(10).priorityHigh();
            } else {
                make.left.mas_equalTo(self.leftImageView.mas_right).offset(8).priorityHigh();
            }
            make.centerY.mas_equalTo(self.contentView);
        }];
        [self.rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.rightImageView.isHidden) {
                make.right.mas_equalTo(-10);
            } else {
                make.right.mas_equalTo(self.rightImageView.mas_left).offset(-8);
            }
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(self.leftLabel.mas_right).offset(30);
            make.bottom.mas_equalTo(-10);
        }];
    }
}

- (void)setLeftImageHide:(BOOL)hidden {
    self.leftImageView.hidden = hidden;
    if (hidden) {
        [self.leftLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
        }];
    } else {
        [self.leftLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(8);
        }];
    }
}

- (void)setRightImageHide:(BOOL)hidden {
    self.rightImageView.hidden = hidden;
    [self.rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        if (self.rightImageView.isHidden) {
            make.right.mas_equalTo(-10);
        } else {
            make.right.mas_equalTo(self.rightImageView.mas_left).offset(-8);
        }
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(self.leftLabel.mas_right).offset(30);
        make.bottom.mas_equalTo(-10);
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

- (UIImageView*)leftImageView {
    if (!_leftImageView) {
        _leftImageView = ({
            UIImageView* object = [[UIImageView alloc]init];
            object.contentMode = UIViewContentModeScaleAspectFill;
            object.clipsToBounds = YES;
            object;
        });
    }
    return _leftImageView;
}

- (UILabel*)rightLabel {
    if (!_rightLabel) {
        _rightLabel = ({
            UILabel* object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:14];
            object.textAlignment = NSTextAlignmentRight;
            object.numberOfLines = 0;
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
