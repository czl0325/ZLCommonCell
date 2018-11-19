//
//  ZLTableViewCell3.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/15.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ZLTableViewCell3.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface ZLTableViewCell3 ()

@end

@implementation ZLTableViewCell3

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.multipleImageView];
        [self.multipleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(self.contentView);
        }];
        
        [self.contentView addSubview:self.signleImageView];
        [self.signleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.multipleImageView);
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(120);
        }];
        
        [self.contentView addSubview:self.label1];
        [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.multipleImageView.mas_bottom).offset(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(self.signleImageView.mas_left).offset(-10);
        }];
        
        [self.contentView addSubview:self.label2];
        [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.label1.mas_bottom).offset(8);
            make.left.mas_equalTo(self.label1);
        }];
        
        [self.contentView addSubview:self.dividerLine];
        [self.dividerLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.label2.mas_bottom).offset(8);
            make.height.mas_equalTo(5);
            make.left.right.bottom.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setArrayImages:(NSArray<NSString *> *)arrayImages {
    _arrayImages = arrayImages;
    
    if (arrayImages.count == 1) {
        NSString* str = arrayImages[0];
        if ([str hasPrefix:@"http"]) {
            [self.signleImageView sd_setImageWithURL:[NSURL URLWithString:str]];
        } else {
            self.signleImageView.image = [UIImage imageNamed:str];
        }
        self.multipleImageView.hidden = YES;
        self.multipleImageView.arrayImages = nil;
        [self.label1 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(self.signleImageView.mas_left).offset(-10);
        }];
        [self.label2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.label1.mas_bottom).offset(5);
            make.left.mas_equalTo(self.label1);
        }];
        [self.signleImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.multipleImageView);
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(120).priorityHigh();
        }];
        [self.dividerLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.signleImageView.mas_bottom);
            make.height.mas_equalTo(5);
            make.left.right.bottom.mas_equalTo(self.contentView);
        }];
    } else {
        self.multipleImageView.hidden = NO;
        self.multipleImageView.arrayImages = arrayImages;
        [self.label1 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.multipleImageView.mas_bottom).offset(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        [self.signleImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.multipleImageView);
            make.width.mas_equalTo(0);
            make.height.mas_equalTo(0);
        }];
        [self.label2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.label1.mas_bottom).offset(5);
            make.left.mas_equalTo(self.label1);
        }];
        [self.dividerLine mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.label2.mas_bottom).offset(8);
            make.height.mas_equalTo(5);
            make.left.right.bottom.mas_equalTo(self.contentView);
        }];
    }
}


- (UILabel *)label1{
    if(!_label1){
        _label1 = ({
            UILabel * object = [[UILabel alloc]init];
            object.numberOfLines = 2;
            object;
       });
    }
    return _label1;
}

- (UILabel *)label2{
    if(!_label2){
        _label2 = ({
            UILabel * object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:14];
            object;
       });
    }
    return _label2;
}

- (ZLMultipleImageView *)multipleImageView{
    if(!_multipleImageView){
        _multipleImageView = ({
            ZLMultipleImageView * object = [[ZLMultipleImageView alloc]init];
            object;
       });
    }
    return _multipleImageView;
}

- (UIImageView *)signleImageView{
    if(!_signleImageView){
        _signleImageView = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.clipsToBounds = YES;
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
       });
    }
    return _signleImageView;
}

- (UIView*)dividerLine {
    if (!_dividerLine) {
        _dividerLine = ({
            UIView * object = [[UIView alloc]init];
            object.backgroundColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0];
            object;
        });
    }
    return _dividerLine;
}
@end
