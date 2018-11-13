//
//  ZLTableViewCell1.h
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/13.
//  Copyright © 2018 czl. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    左边图片 100*150
    图片右侧上边一个文字，下边一个文字
 **/

NS_ASSUME_NONNULL_BEGIN

@interface ZLTableViewCell1 : UITableViewCell

@property(nonatomic,strong)UIImageView* leftImageView;
@property(nonatomic,strong)UILabel* label1;
@property(nonatomic,strong)UILabel* label2;

@end

NS_ASSUME_NONNULL_END
