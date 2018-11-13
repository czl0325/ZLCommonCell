//
//  ZLWrapTextCell.h
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/13.
//  Copyright © 2018 czl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLWrapTextCell : UITableViewCell

@property(nonatomic,strong)UILabel* leftLabel;
@property(nonatomic,strong)UIImageView* leftImageView;
@property(nonatomic,strong)UILabel* rightLabel;
@property(nonatomic,strong)UIImageView* rightImageView;

- (void)setLeftText:(NSString*)text1 rightText:(NSString*)text2;
- (void)setLeftImageHide:(BOOL)hidden;
- (void)setRightImageHide:(BOOL)hidden;

@end

NS_ASSUME_NONNULL_END
