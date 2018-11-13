//
//  ViewController.m
//  ZLCommonCellDemo
//
//  Created by zhaoliang chen on 2018/11/13.
//  Copyright © 2018 czl. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "ZLWrapTextCell.h"
#import "ZLTextHeaderFooterView.h"
#import "ZLButtonHeaderFooterView.h"

@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray* arrayDatas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.arrayDatas = @[@"美国漫威之父斯坦-李去世 曾创造蜘蛛侠等角色",@"银隆原董事长魏银仓、原总裁孙国华涉嫌非法侵占公司超10亿",@"工行20亿电票诈骗案曝光： 借银行办公室 雇人冒充银行董事长",@"高圆圆自曝3年不拍片原因，首回应被催生：不想按别人想法活着.高圆圆自曝3年不拍片原因，首回应被催生：不想按别人想法活着"];
    
    UITableView* tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerClass:[ZLWrapTextCell class] forCellReuseIdentifier:@"ZLWrapTextCell"];
    [tableView registerClass:ZLTextHeaderFooterView.class forHeaderFooterViewReuseIdentifier:@"ZLTextHeaderFooterView"];
    [tableView registerClass:ZLButtonHeaderFooterView.class forHeaderFooterViewReuseIdentifier:@"ZLButtonHeaderFooterView"];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZLWrapTextCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ZLWrapTextCell"];
    [cell setLeftText:[NSString stringWithFormat:@"文章-%zd",indexPath.row] rightText:self.arrayDatas[indexPath.row]];
    cell.leftImageView.image = [UIImage imageNamed:@"timg"];
    if (indexPath.row == self.arrayDatas.count - 1) {
        [cell setLeftImageHide:NO];
        [cell setRightImageHide:NO];
    } else {
        if (indexPath.row % 2 == 0) {
            [cell setLeftImageHide:YES];
            [cell setRightImageHide:NO];
        } else {
            [cell setLeftImageHide:NO];
            [cell setRightImageHide:YES];
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZLTextHeaderFooterView* header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ZLTextHeaderFooterView"];
    header.leftLabel.text = @"标题";
    //[header setRightImageHide:YES];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 60;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    ZLButtonHeaderFooterView* footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ZLButtonHeaderFooterView"];
    footer.onTouchButton = ^{
        NSLog(@"点击事件");
    };
    return footer;
}


@end
