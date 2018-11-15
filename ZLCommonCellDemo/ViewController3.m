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
    cell.label3.text = @"刘亦菲，1987年8月25日出生于湖北省武汉市，华语影视女演员、歌手，毕业于北京电影学院2002级表演系本科班。\n2002年主演个人首部电视剧《金粉世家》，从而踏入演艺圈 [1]  。2003年因主演武侠剧《天龙八部》崭露头角 [2]  。2004年凭借仙侠剧《仙剑奇侠传》赵灵儿一角获得了高人气与关注度 [3]  。2005年因在金庸剧《神雕侠侣》中饰演小龙女受到广泛关注 [4-5]  。2006年发行首张音乐专辑《刘亦菲》 [6]  ；同年，成为金鹰节历史上首位金鹰女神 [7]  。2007年当选“中国80后十大杰出代表人物” [8]  。2008年起转战影坛，并凭借好莱坞电影《功夫之王》成为首位荣登IMDB电影新人排行榜榜首的亚洲女星 [9-10]  。2009年在“80后新生代娱乐大明星”评选活动中获封“四小花旦”之一 [11]  。2011年主演古装片《鸿门宴传奇》 [12]  。\n2014年，凭借出演剧情片《铜雀台》中灵雎一角获得第5届澳门国际电影节最佳女主角 [13]  。2015年主演战争片《烽火芳菲》，该片还入围了第20届上海国际电影节-金爵奖主竞赛单元 [14-15]  。2016年，凭借出演爱情片《第三种爱情》中邹雨一角获得第16届华语电影传媒大奖最受瞩目女演员 [16]  ；同年，其主演的文艺片《夜孔雀》入围了第40届蒙特利尔国际电影节主竞赛单元 [17]  。2017年11月30日，确定出演迪士尼真人版剧情电影《花木兰》 [18]  ；同年，凭借奇幻喜剧片《二代妖精之今生有幸》中白纤楚一角获得颇高关注 [19-20]  。\n演艺事业外，刘亦菲热心慈善公益，2008年担任中国少年儿童基金会形象大使 [21]  ；2009年被授予“中国儿童慈善奖”等 [22]  ；2016年当选“中国80后十大影响力人物” [23]  。";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewController3* vc = [[ViewController3 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
