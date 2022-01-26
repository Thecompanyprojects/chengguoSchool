//
//  HomeVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/22.
//

#import "HomeVC.h"
#import "HomeManagerScroll.h"
#import "HomeheadView.h"
#import "TeacherManagerVC.h"
#import "homeTeacherCell.h"
#import "StudentManagerVC.h"
#import "ScreenVC.h"
#import "LeaveManagerVC.h"

@interface HomeVC ()<YBPopupMenuDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UIButton *managerBtn;
@property (nonatomic,strong) HomeManagerScroll *scrollView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) HomeheadView *headView;
@property (nonatomic,strong) UIButton *rightBtn;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(0xF9F9F9, 1);
    self.navigationItem.title = @"";
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.tableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.topItem.rightBarButtonItems=nil;
    self.navigationController.navigationBar.topItem.leftBarButtonItem=nil;
    self.navigationController.navigationBar.topItem.rightBarButtonItems=nil;
    self.navigationController.navigationBar.topItem.leftBarButtonItems=nil;
//    self.navigationController.navigationBar.topItem.titleView = nil;
//    self.navigationController.navigationBar.topItem.title = @"";
    if (@available(iOS 13.0, *)) {
        UINavigationBarAppearance *barApp = [UINavigationBarAppearance new];
        [barApp setBackgroundColor:RGBA(0xF9F9F9, 1)];
        [barApp setShadowColor:[UIColor clearColor]];
        self.navigationController.navigationBar.scrollEdgeAppearance = barApp;
        self.navigationController.navigationBar.standardAppearance = barApp;
    }
    [self createTopView];
    [self createRightBtn];
    NSString *typestr = [[NSUserDefaults standardUserDefaults] objectForKey:@"typestr"];
    if (typestr.length==0) {
        [self.scrollView setHidden:false];
        [self.tableView setHidden:true];
        [self.rightBtn setHidden:true];
        [self.managerBtn setTitle:@"学校管理员" forState:normal];
    }
    else
    {
        [self.scrollView setHidden:true];
        [self.tableView setHidden:false];
        [self.rightBtn setHidden:false];
        [self.managerBtn setTitle:@"指导老师" forState:normal];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *barApp = [UINavigationBarAppearance new];
        [barApp setBackgroundColor:RGBA(0xF1F6FB, 1)];
        [barApp setShadowColor:[UIColor clearColor]];
        self.navigationController.navigationBar.scrollEdgeAppearance = barApp;
        self.navigationController.navigationBar.standardAppearance = barApp;
    }
    if ([self.navigationController.view  viewWithTag:99]) {
        UIImageView*hengxian=[self.navigationController.view  viewWithTag:99];
        hengxian.hidden=NO;
    }
}

-(void)createTopView{
    if (!_managerBtn) {
        self.managerBtn = [UIButton new];
    }
    self.managerBtn.frame = CGRectMake(20, 0, 130, 40);
    self.managerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.managerBtn setTitle:@"" forState:normal];
    self.managerBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.managerBtn setTitleColor:RGBA(0x333333, 1) forState:normal];
    [self.managerBtn addTarget:self action:@selector(managerClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.managerBtn];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

-(void)createRightBtn{
    self.rightBtn = [UIButton new];
    [self.rightBtn setImage:[UIImage imageNamed:@"right_item"] forState:normal];
    [self.rightBtn addTarget:self action:@selector(rightbtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    if (@available(iOS 11.0, *)) {
        rightBarButtonItem.customView.frame = CGRectMake(0, 0, 30, 30);
    }
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

-(void)rightbtnClick{
    
}

-(HomeManagerScroll *)scrollView
{
    if(!_scrollView)
    {
        _scrollView = [HomeManagerScroll new];
        _scrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _scrollView.contentSize = CGSizeMake(kScreenWidth, 90*s_ScaleWidth*9+56*3+80+160);
    }
    return _scrollView;
}

-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [UITableView new];
        _tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = RGBA(0xF1F6FB, 1);
        _tableView.tableFooterView = [UIView new];
        [_tableView setHidden:true];
        [_tableView  setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}

-(HomeheadView *)headView
{
    if(!_headView)
    {
        _headView = [HomeheadView new];
        _headView.backgroundColor = RGBA(0xF1F6FB, 1);
        _headView.frame = CGRectMake(0, 0, kScreenWidth, 212+20+36);
        _headView.managerView0.userInteractionEnabled = true;
        UITapGestureRecognizer *singleTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseAction0)];
        [_headView.managerView0 addGestureRecognizer:singleTap];
        _headView.managerView1.userInteractionEnabled = true;
        UITapGestureRecognizer *singleTap1 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseAction1)];
        [_headView.managerView1 addGestureRecognizer:singleTap1];
        [_headView.screenBtn addTarget:self action:@selector(headscreenbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

-(void)headscreenbtnClick
{
    ScreenVC *vc = [ScreenVC new];
    [self.navigationController pushViewController:vc animated:true];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    homeTeacherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[homeTeacherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = RGBA(0xF1F6FB, 1);
    if (indexPath.row==0) {
        cell.leftView.backgroundColor = RGBA(0xFF0000, 1);
        cell.nameLab.text = @"请假申请";
    }
    if (indexPath.row==1) {
        cell.leftView.backgroundColor = RGBA(0xFF0000, 1);
        cell.nameLab.text = @"岗位变更申请";
    }
    if (indexPath.row==2) {
        cell.leftView.backgroundColor = RGBA(0xFF0000, 1);
        cell.nameLab.text = @"免实习申请";
    }
    if (indexPath.row==3) {
        cell.leftView.backgroundColor = RGBA(0x086EF6, 1);
        cell.nameLab.text = @"请假申请";
    }
    if (indexPath.row==4) {
        cell.leftView.backgroundColor = RGBA(0x086EF6, 1);
        cell.nameLab.text = @"月报申请";
    }
    if (indexPath.row==5) {
        cell.leftView.backgroundColor = RGBA(0x086EF6, 1);
        cell.nameLab.text = @"总结批阅申请";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}


#pragma mark - click

-(void)managerClick
{
    NSArray *titleArray = @[@"学校管理员",@"指导老师"];
    NSArray *iconArray = @[@"",@""];
    [YBPopupMenu showRelyOnView:self.managerBtn titles:titleArray icons:iconArray menuWidth:120 otherSettings:^(YBPopupMenu *popupMenu) {
        popupMenu.delegate = self;
    }];
}

- (void)ybPopupMenu:(YBPopupMenu *)ybPopupMenu didSelectedAtIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
    if (index==0) {
        [self.scrollView setHidden:false];
        [self.tableView setHidden:true];
        [self.managerBtn setTitle:@"学校管理员" forState:normal];
        [self.rightBtn setHidden:true];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"typestr"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    if (index==1) {
        [self.scrollView setHidden:true];
        [self.tableView setHidden:false];
        [self.managerBtn setTitle:@"指导老师" forState:normal];
        [self.rightBtn setHidden:false];
        [[NSUserDefaults standardUserDefaults] setObject:@"11" forKey:@"typestr"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

-(void)chooseAction0{
    TeacherManagerVC *vc = [TeacherManagerVC new];
    [self.navigationController pushViewController:vc animated:true];
}

-(void)chooseAction1{
    StudentManagerVC *vc = [StudentManagerVC new];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        LeaveManagerVC *vc = [LeaveManagerVC new];
        [self.navigationController pushViewController:vc animated:true];
    }
}

@end
