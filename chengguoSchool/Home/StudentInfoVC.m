//
//  StudentInfoVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/25.
//

#import "StudentInfoVC.h"
#import "StudentInfoCell.h"

@interface StudentInfoVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation StudentInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
    self.navigationItem.title = @"学生详细信息";
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
    }
    return _tableView;
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StudentInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[StudentInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.nameLab.text = self.nameStr;
    if (indexPath.row==0) {
        [cell.nameLab setHidden:false];
        cell.bgImg.image = [UIImage imageNamed:@"studentInfo0"];
    }
    if (indexPath.row==1) {
        [cell.nameLab setHidden:true];
        cell.bgImg.image = [UIImage imageNamed:@"studentInfo1"];
    }
    if (indexPath.row==2) {
        [cell.nameLab setHidden:true];
        cell.bgImg.image = [UIImage imageNamed:@"studentInfo2"];
    }
    if (indexPath.row==3) {
        [cell.nameLab setHidden:true];
        cell.bgImg.image = [UIImage imageNamed:@"studentInfo3"];
    }
    if (indexPath.row==4) {
        [cell.nameLab setHidden:true];
        cell.bgImg.image = [UIImage imageNamed:@"studentInfo4"];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 267*s_ScaleWidth+16;
    }
    if (indexPath.row==1) {
        return 164*s_ScaleWidth+16;
    }
    if (indexPath.row==2) {
        return 185*s_ScaleWidth+16;
    }
    if (indexPath.row==3) {
        return 185*s_ScaleWidth+16;
    }
    if (indexPath.row==4) {
        return 98*s_ScaleWidth+16;
    }
    return 0.01f;
}
@end
