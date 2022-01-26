//
//  StatisticsVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "StatisticsVC.h"
#import "StatisticsCell.h"
#import "StatisticsheadView.h"
#import "StatisticsStudentVC.h"


@interface StatisticsVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) StatisticsheadView *headView;
@end

@implementation StatisticsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"实习岗位审核与统计";
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
    [self.view addSubview:self.tableView];
}

-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [UITableView new];
        _tableView.backgroundColor = RGBA(0xF1F6FB, 1);
        _tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView  setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}

-(StatisticsheadView *)headView
{
    if(!_headView)
    {
        _headView = [StatisticsheadView new];
        _headView.frame = CGRectMake(0, 0, kScreenWidth, 440);
        [_headView.leftBtn addTarget:self action:@selector(listClick) forControlEvents:UIControlEventTouchUpInside];
        [_headView.rightBtn addTarget:self action:@selector(listClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StatisticsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[StatisticsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row==0) {
        cell.nameLab.text = @"李思远";
        cell.messageLab.text = @"实习岗位申请（办公室文员）";
    }
    if (indexPath.row==1) {
        cell.nameLab.text = @"张云飞";
        cell.messageLab.text = @"实习岗位申请（人力资源-储备干部）";
    }
    if (indexPath.row==2) {
        cell.nameLab.text = @"朱颖";
        cell.messageLab.text = @"企业变更申请（金信泽有限公司-恒鑫有限公司）";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 118+12;
}

-(void)listClick
{
    StatisticsStudentVC *vc = [StatisticsStudentVC new];
    [self.navigationController pushViewController:vc animated:true];
}


@end
