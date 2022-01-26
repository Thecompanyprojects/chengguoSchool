//
//  MessageVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "MessageVC.h"
#import "MessageCell.h"
#import "AddMessageVC.h"

@interface MessageVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UIButton *managerBtn;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIButton *allBtn;
@property (nonatomic,strong) UIImageView *emptyImg;
@end

@implementation MessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self createButton];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.allBtn];
    [self.view addSubview:self.emptyImg];
    NSString *typestr = [[NSUserDefaults standardUserDefaults] objectForKey:@"typestr"];
    if (typestr.length==0) {
        [self.tableView setHidden:true];
        [self.allBtn setHidden:true];
        [self.emptyImg setHidden:false];
    }
    else
    {
        [self.tableView setHidden:false];
        [self.allBtn setHidden:false];
        [self.emptyImg setHidden:true];
    }
    
}

-(void)createButton{
    self.managerBtn = [UIButton new];
    [self.managerBtn setTitle:@"通知" forState:normal];
    self.managerBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.managerBtn setTitleColor:RGBA(0x333333, 1) forState:normal];
    [self.managerBtn addTarget:self action:@selector(managerClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.managerBtn];
    if (@available(iOS 11.0, *)) {
        leftBarButtonItem.customView.frame = CGRectMake(0, 0, 30, 84);
    }
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

-(void)managerClick{
    
}

-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [UITableView new];
        _tableView.backgroundColor = RGBA(0xF1F6FB, 1);
        _tableView.frame = CGRectMake(0,0, kScreenWidth, kScreenHeight);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = RGBA(0xF1F6FB, 1);
        _tableView.layer.masksToBounds = true;
        _tableView.layer.cornerRadius = 8;
        _tableView.tableFooterView = [UIView new];
        [_tableView  setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.showsVerticalScrollIndicator = false;
        _tableView.showsHorizontalScrollIndicator = false;
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[MessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row==0) {
        cell.pointView.backgroundColor = [UIColor redColor];
        cell.nameLab.text = @"审批提醒";
        cell.timeLab.text = @"2021-11月6日 13:28";
        cell.messageLab.text = @"校长｜2021年11月6日-2021年11月10日";
        cell.messageLab1.text = @"您的销假申请已完成，请知悉";
    }
    if (indexPath.row==1) {
        cell.pointView.backgroundColor = [UIColor blueColor];
        cell.nameLab.text = @"培训通知";
        cell.timeLab.text = @"2021-11月6日 14:28";
        cell.messageLab.text = @"主任｜2021年11月6日-2021年11月10日";
        cell.messageLab1.text = @"您将于3天后参加培训，请知悉";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 141+16;
}

-(UIButton *)allBtn
{
    if(!_allBtn)
    {
        _allBtn = [UIButton new];
        _allBtn.frame = CGRectMake(kScreenWidth-80, kScreenHeight-60-120, 60, 60);
        [_allBtn setImage:[UIImage imageNamed:@"添加"] forState:normal];
        [_allBtn addTarget:self action:@selector(addbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allBtn;
}

-(void)addbtnClick
{
    AddMessageVC *vc = [AddMessageVC new];
    [self.navigationController pushViewController:vc animated:true];
}

-(UIImageView *)emptyImg
{
    if(!_emptyImg)
    {
        _emptyImg = [UIImageView new];
        [_emptyImg setHidden:true];
        _emptyImg.image = [UIImage imageNamed:@"无数据"];
        _emptyImg.frame = CGRectMake(kScreenWidth/2-134/2, kScreenHeight/2-134/2, 134, 134);
    }
    return _emptyImg;
}


@end
