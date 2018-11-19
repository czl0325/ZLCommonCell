//
//  ZLTableViewCell3.h
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/15.
//  Copyright © 2018 czl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLMultipleImageView.h"

/**
 新闻资讯类的cell
 **/

NS_ASSUME_NONNULL_BEGIN

@interface ZLTableViewCell3 : UITableViewCell

@property(nonatomic,strong)UILabel* label1;
@property(nonatomic,strong)UILabel* label2;
@property(nonatomic,strong)ZLMultipleImageView* multipleImageView;
@property(nonatomic,strong)UIImageView* signleImageView;
@property(nonatomic,strong)UIView* dividerLine;

@property(nonatomic,copy)NSArray<NSString*>* arrayImages;

@end

NS_ASSUME_NONNULL_END
