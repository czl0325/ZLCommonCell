//
//  ZLTableViewCell1.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/13.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ZLTableViewCell1.h"
#import "Masonry.h"

@implementation ZLTableViewCell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.leftImageView];
        [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(100, 150));
            make.bottom.mas_equalTo(-10);
        }];
        
        [self.contentView addSubview:self.label1];
        [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(8);
            make.top.mas_equalTo(self.leftImageView);
            make.right.mas_equalTo(-10);
        }];
        
        [self.contentView addSubview:self.label2];
        [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.label1);
            make.top.mas_equalTo(self.label1.mas_bottom).offset(8);
            make.right.mas_equalTo(-10);
        }];
    }
    return self;
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

- (UILabel*)label1 {
    if (!_label1) {
        _label1 = ({
            UILabel* object = [[UILabel alloc]init];
            object.numberOfLines = 0;
            object;
        });
    }
    return _label1;
}

- (UILabel*)label2 {
    if (!_label2) {
        _label2 = ({
            UILabel* object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:14];
            object.numberOfLines = 0;
            object;
        });
    }
    return _label2;
}

@end
