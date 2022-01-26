//
//  ScreenVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "ScreenVC.h"
#import "ScreenCell.h"

@interface ScreenVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UIButton *chooseBtn;
@end

@implementation ScreenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"筛选";
    
    self.dataSource = [NSMutableArray arrayWithObjects:@"请假申请",@"补签申请",@"免签申请",@"日报申请",@"周报申请",@"月报申请",@"免实习申请",@"实习岗位申请",@"岗位变更申请",@"总结批阅申请",@"就业上报申请", nil];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.backBtn];
    [self.view addSubview:self.chooseBtn];
    self.backBtn.frame = CGRectMake(0, kScreenHeight-60, 120, 51);
    self.chooseBtn.frame = CGRectMake(120, kScreenHeight-60, kScreenWidth-120, 51);
}

-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [UITableView new];
        _tableView.backgroundColor = RGBA(0xF1F6FB, 1);
        _tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-60);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView  setSeparatorStyle:UITableViewCellSeparatorStyleNone];

    }
    return _tableView;
}

-(UIButton *)backBtn
{
    if(!_backBtn)
    {
        _backBtn = [UIButton new];
        _backBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_backBtn setTitle:@"重置" forState:normal];
        [_backBtn setTitleColor:RGBA(0x333333, 1) forState:normal];
        _backBtn.backgroundColor = [UIColor whiteColor];
        [_backBtn addTarget:self action:@selector(backbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

-(UIButton *)chooseBtn
{
    if(!_chooseBtn)
    {
        _chooseBtn = [UIButton new];
        _chooseBtn.backgroundColor = RGBA(0xFF7A33, 1);
        [_chooseBtn setTitleColor:[UIColor whiteColor] forState:normal];
        _chooseBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_chooseBtn setTitle:@"选中" forState:normal];
        [_chooseBtn addTarget:self action:@selector(choosebtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chooseBtn;
}

-(void)backbtnClick
{
    [self.navigationController popViewControllerAnimated:true];
}

-(void)choosebtnClick
{
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ScreenCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[ScreenCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.nameLab.text = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

@end
    
