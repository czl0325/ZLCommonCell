//
//  ViewController3.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/15.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ViewController3.h"
#import "ZLTableViewCell2.h"
#import "Masonry.h"
#import "ViewController4.h"

@interface ViewController3 ()
<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"上图+下";
    
    UITableView* tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[ZLTableViewCell2 class] forCellReuseIdentifier:@"ZLTableViewCell2"];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZLTableViewCell2* cell = [tableView dequeueReusableCellWithIdentifier:@"ZLTableViewCell2"];
    cell.topImageView.image = [UIImage imageNamed:@"liuyifei"];
    cell.label1.text = @"刘亦菲";
    cell.label2.text = @"影视演员";
    cell.label3.text = @"刘亦菲，1987年8月25日出生于湖北省武汉市，华语影视女演员、歌手，毕业于北京电影学院2002级表演系本科班。";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewController4* vc = [[ViewController4 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
