//
//  ViewController4.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/15.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ViewController4.h"
#import "Masonry.h"
#import "ZLCollectionCell1.h"
#import "ViewController5.h"

@interface ViewController4 ()
<UICollectionViewDelegate,UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"上图下文";
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    UICollectionView* collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:ZLCollectionCell1.class forCellWithReuseIdentifier:@"ZLCollectionCell1"];
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLCollectionCell1* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZLCollectionCell1" forIndexPath:indexPath];
    cell.topImageView.image = [UIImage imageNamed:@"liuyifei"];
    cell.bottomLabel.text = [NSString stringWithFormat:@"当前节点:%zd",indexPath.item];
    cell.layer.borderColor = [UIColor grayColor].CGColor;
    cell.layer.borderWidth = 1;
    if (indexPath.item % 2 == 0) {
        cell.fillImage = YES;
        if (indexPath.item == 0) {
            [cell setLabelHide:YES];
        } else {
            [cell setLabelHide:NO];
        }
    } else {
        cell.fillImage = NO;
        if (indexPath.item == 1) {
            [cell setLabelHide:YES];
        } else {
            [cell setLabelHide:NO];
        }
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 150);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ViewController5* vc = [[ViewController5 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
