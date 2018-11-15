//
//  ViewController2.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/15.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ViewController2.h"
#import "ZLTableViewCell1.h"
#import "Masonry.h"
#import "ViewController3.h"

@interface ViewController2 ()
<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"左图+右上文字+右下文字";
    
    UITableView* tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[ZLTableViewCell1 class] forCellReuseIdentifier:@"ZLTableViewCell1"];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZLTableViewCell1* cell = [tableView dequeueReusableCellWithIdentifier:@"ZLTableViewCell1"];
    cell.leftImageView.image = [UIImage imageNamed:@"liuyifei"];
    cell.label1.text = @"刘亦菲";
    cell.label2.text = @"影视演员";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewController3* vc = [[ViewController3 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
