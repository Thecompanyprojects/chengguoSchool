//
//  StudentManagerVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "StudentManagerVC.h"
#import "StudentHeadView.h"
#import "StudentCell.h"
#import "SigninlistVC.h"
#import "AuditlistVC.h"
#import "StatisticsStudentVC.h"
#import "StudentListViewController.h"
#import "StatisticsVC.h"

@interface StudentManagerVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) StudentHeadView *headView;
@end

@implementation StudentManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"学生管理";
    // Do any additional setup after loading the view.
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
        _tableView.layer.masksToBounds = true;
        _tableView.layer.cornerRadius = 8;
        _tableView.tableFooterView = [UIView new];
        [_tableView  setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.tableHeaderView = self.headView;
        _tableView.showsVerticalScrollIndicator = false;
        _tableView.showsHorizontalScrollIndicator = false;
    }
    return _tableView;
}

-(StudentHeadView *)headView
{
    if(!_headView)
    {
        _headView = [StudentHeadView new];
        _headView.frame = CGRectMake(0, 0, kScreenWidth, 146);
        [_headView.btn addTarget:self action:@selector(studentlistClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StudentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[StudentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row==0) {
        cell.leftImg.image = [UIImage imageNamed:@"studentLeft1"];
        cell.nameLab.text = @"签到预警提示";
    }
    if (indexPath.row==1) {
        cell.leftImg.image = [UIImage imageNamed:@"studentLeft0"];
        cell.nameLab.text = @"实习岗位审核与统计";
    }
    if (indexPath.row==2) {
        cell.leftImg.image = [UIImage imageNamed:@"studentLeft2"];
        cell.nameLab.text = @"报告审核与批阅";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 66+16;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        SigninlistVC *vc = [SigninlistVC new];
        [self.navigationController pushViewController:vc animated:true];
    }
    if (indexPath.row==1) {
        StatisticsVC *vc = [StatisticsVC new];
        [self.navigationController pushViewController:vc animated:true];
    }
    if (indexPath.row==2) {
        AuditlistVC *vc = [AuditlistVC new];
        [self.navigationController pushViewController:vc animated:true];
    }
}

-(void)studentlistClick{
    StudentListViewController *vc = [StudentListViewController new];
    [self.navigationController pushViewController:vc animated:true];
}

@end
