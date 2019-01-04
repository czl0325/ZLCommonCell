//
//  ZLCollectionCell1.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/15.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ZLCollectionCell1.h"
#import "Masonry.h"

@implementation ZLCollectionCell1

#define ImageSize 30

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.topImageView];
        [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(ImageSize);
            make.centerX.mas_equalTo(self.contentView);
            make.bottom.mas_equalTo(self.contentView.mas_centerY).offset(10);
        }];
        
        [self.contentView addSubview:self.bottomLabel];
        [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.topImageView.mas_bottom).offset(5);
        }];
    }
    return self;
}

- (void)setLabelHide:(BOOL)hidden {
    self.bottomLabel.hidden = hidden;
    if (hidden) {
        [self.topImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.fillImage) {
                make.edges.mas_equalTo(self.contentView);
            } else {
                make.size.mas_equalTo(ImageSize);
                make.center.mas_equalTo(self.contentView);
            }
        }];
    } else {
        [self.topImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (self.fillImage) {
                make.top.width.centerX.mas_equalTo(self.contentView);
                make.bottom.mas_equalTo(-22);
            } else {
                make.size.mas_equalTo(ImageSize);
                make.centerX.mas_equalTo(self.contentView);
                make.bottom.mas_equalTo(self.contentView.mas_centerY).offset(5);
            }
        }];
    }
}

- (void)setFillImage:(BOOL)fillImage {
    _fillImage = fillImage;
    if (fillImage) {
        [self.topImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.width.centerX.mas_equalTo(self.contentView);
            if (self.bottomLabel.isHidden) {
                make.bottom.mas_equalTo(self.contentView);
            } else {
                make.bottom.mas_equalTo(-22);
            }
        }];
    } else {
        [self.topImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(ImageSize);
            make.centerX.mas_equalTo(self.contentView);
            if (self.bottomLabel.isHidden) {
                make.bottom.mas_equalTo(self.contentView);
            } else {
                make.bottom.mas_equalTo(self.contentView.mas_centerY).offset(15);
            }
        }];
    }
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

- (UILabel*)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = ({
            UILabel* object = [[UILabel alloc]init];
            object.textAlignment = NSTextAlignmentCenter;
            object.font = [UIFont systemFontOfSize:14];
            object;
        });
    }
    return _bottomLabel;
}

@end
