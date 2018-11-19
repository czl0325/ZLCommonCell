//
//  ViewController5.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/16.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ViewController5.h"
#import "Masonry.h"
#import "ZLTableViewCell3.h"

@interface ViewController5 ()
<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"仿QQ看点";
    
    UITableView* tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[ZLTableViewCell3 class] forCellReuseIdentifier:@"ZLTableViewCell3"];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZLTableViewCell3* cell = [tableView dequeueReusableCellWithIdentifier:@"ZLTableViewCell3"];
    if (indexPath.row%2==0) {
        cell.arrayImages = @[@"liuyifei"];
    } else {
        cell.arrayImages = @[@"liuyifei",@"liuyifei",@"liuyifei"];
    }
    cell.label1.text = @"1987年8月25日出生于湖北省武汉市，华语影视女演员、歌手，毕业于北京电影学院2002级表演系本科班。";
    cell.label2.text = @"刘亦菲";
    return cell;
}

@end
