//
//  ZLMultipleImageView.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/15.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ZLMultipleImageView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface ZLMultipleImageView ()

@property(nonatomic,strong)NSMutableArray* arrayImageViews;

@end

@implementation ZLMultipleImageView

- (instancetype)init {
    return [self initWithMaxCount:9 row:3];
}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithMaxCount:9 row:3];
}

- (instancetype)initWithMaxCount:(NSInteger)maxCount row:(NSInteger)row {
    if (self == [super initWithFrame:CGRectZero]) {
        self.clipsToBounds = YES;
        
        UIImageView* tempV = nil;
        NSMutableArray* tempArray = [NSMutableArray new];
        for (int i=0; i<maxCount; i++) {
            UIImageView* imgV = [[UIImageView alloc]init];
            imgV.clipsToBounds = YES;
            imgV.contentMode = UIViewContentModeScaleAspectFill;
            imgV.userInteractionEnabled = YES;
            imgV.tag = i;
            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage:)];
            [imgV addGestureRecognizer:tap];
            [self addSubview:imgV];
            [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
                if (i==0) {
                    make.top.mas_equalTo(0);
                } else {
                    if (i%row==0) {
                        make.top.mas_equalTo(tempV.mas_bottom).offset(5).priorityHigh();
                    } else {
                        make.top.mas_equalTo(tempV);
                    }
                }
                make.height.mas_equalTo(120).priority(1000);
                
                if (i >= row) {
                    UIImageView* im = self.arrayImageViews[i%row];
                    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.left.width.mas_equalTo(im);
                    }];
                }
            }];
            if (i < row) {
                if (maxCount < row) {
                    if (i == 0) {
                        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.left.mas_equalTo(0);
                            make.width.mas_equalTo(self.mas_width).dividedBy(row);
                        }];
                    } else {
                        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.left.mas_equalTo(tempV.mas_right).offset(5);
                            make.width.mas_equalTo(self.mas_width).dividedBy(row);
                        }];
                    }
                } else {
                    [tempArray addObject:imgV];
                    if (tempArray.count == row) {
                        [tempArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:0 tailSpacing:0];
                        [tempArray removeAllObjects];
                    }
                }
            }
            [self.arrayImageViews addObject:imgV];
            tempV = imgV;
        }
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(tempV.mas_bottom);
        }];
    }
    return self;
}

- (void)onClickImage:(UIGestureRecognizer*)sender {
    if (self.onTouchImage) {
        self.onTouchImage(sender.view.tag);
    }
}

- (void)setArrayImages:(NSArray<NSString *> *)arrayImages {
    if (arrayImages == nil) {
        return;
    }
    _arrayImages = arrayImages;
    
    for (int i=0; i<self.arrayImageViews.count; i++) {
        UIImageView* imgV = self.arrayImageViews[i];
        if (i<arrayImages.count) {
            NSString* str = arrayImages[i];
            if ([str hasPrefix:@"http"]) {
                [imgV sd_setImageWithURL:[NSURL URLWithString:str]];
            } else {
                imgV.image = [UIImage imageNamed:str];
            }
        }
        if (i==arrayImages.count-1) {
            [self mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(imgV.mas_bottom);
            }];
            break;
        }
    }
}


- (NSMutableArray *)arrayImageViews{
    if(!_arrayImageViews){
        _arrayImageViews = ({
            NSMutableArray * object = [[NSMutableArray alloc]init];
            object;
       });
    }
    return _arrayImageViews;
}
@end
