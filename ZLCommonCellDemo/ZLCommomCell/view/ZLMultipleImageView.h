//
//  ZLMultipleImageView.h
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/15.
//  Copyright © 2018 czl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLMultipleImageView : UIView

- (instancetype)initWithMaxCount:(NSInteger)maxCount row:(NSInteger)row ;

@property(nonatomic,copy)NSArray<NSString*>* _Nullable  arrayImages;
@property(nonatomic,copy)void (^onTouchImage)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
