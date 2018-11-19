//
//  ZLCollectionCell1.h
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/15.
//  Copyright © 2018 czl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLCollectionCell1 : UICollectionViewCell

@property(nonatomic,strong)UIImageView* topImageView;
@property(nonatomic,strong)UILabel* bottomLabel;

- (void)setLabelHide:(BOOL)hidden;
@property(nonatomic,assign)BOOL fillImage;

@end

NS_ASSUME_NONNULL_END
