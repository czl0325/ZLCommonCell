//
//  ZLTextHeaderFooterView.h
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/13.
//  Copyright © 2018 czl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLTextHeaderFooterView : UITableViewHeaderFooterView

@property(nonatomic,strong)UILabel* leftLabel;
@property(nonatomic,strong)UILabel* rightLabel;
@property(nonatomic,strong)UIImageView* rightImageView;

- (void)setRightImageHide:(BOOL)hidden;

@end

NS_ASSUME_NONNULL_END
