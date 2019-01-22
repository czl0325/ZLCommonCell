//
//  ZLLabelCell.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/13.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ZLLabelCell.h"
#import "Masonry.h"

@implementation ZLLabelCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

//- (void)setSelected:(BOOL)selected {
//    if (selected) {
//        self.contentView.backgroundColor = [UIColor grayColor];
//        self.label.textColor = [UIColor blackColor];
//    } else {
//        self.contentView.backgroundColor = [UIColor whiteColor];
//        self.label.textColor = [UIColor blackColor];
//    }
//}

- (UILabel*)label {
    if (!_label) {
        _label = ({
            UILabel* object = [[UILabel alloc]init];
            object.textAlignment = NSTextAlignmentCenter;
            object.font = [UIFont systemFontOfSize:14];
            object;
        });
    }
    return _label;
}

@end
