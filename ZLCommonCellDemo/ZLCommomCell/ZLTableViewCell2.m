//
//  ZLTableViewCell2.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/13.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ZLTableViewCell2.h"
#import "Masonry.h"

@implementation ZLTableViewCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.topImageView];
        [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(180);
        }];
        
        [self.contentView addSubview:self.label1];
        [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.topImageView);
            make.top.mas_equalTo(self.topImageView.mas_bottom).offset(8);
        }];
        
        [self.contentView addSubview:self.label2];
        [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.topImageView);
            make.top.mas_equalTo(self.label1);
        }];
        
        [self.contentView addSubview:self.label3];
        [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.topImageView);
            make.top.mas_equalTo(self.label1.mas_bottom).offset(8);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return self;
}

- (UIImageView*)topImageView {
    if (!_topImageView) {
        _topImageView = ({
            UIImageView* object = [[UIImageView alloc]init];
            object.contentMode = UIViewContentModeScaleAspectFill;
            object.clipsToBounds = YES;
            object;
        });
    }
    return _topImageView;
}

- (UILabel*)label1 {
    if (!_label1) {
        _label1 = ({
            UILabel* object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:14];
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
            object.textAlignment = NSTextAlignmentRight;
            object;
        });
    }
    return _label2;
}

- (UILabel*)label3 {
    if (!_label3) {
        _label3 = ({
            UILabel* object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:14];
            object.numberOfLines = 0;
            object;
        });
    }
    return _label3;
}

@end
