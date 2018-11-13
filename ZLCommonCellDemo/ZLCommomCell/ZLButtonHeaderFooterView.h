//
//  ZLButtonHeaderFooterView.h
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/13.
//  Copyright © 2018 czl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLButtonHeaderFooterView : UITableViewHeaderFooterView

@property(nonatomic,strong)UIButton* button;

@property(nonatomic,copy)void (^onTouchButton)(void);

@end

NS_ASSUME_NONNULL_END
