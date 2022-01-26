//
//  StatisticsStudentVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "StatisticsStudentVC.h"

@interface StatisticsStudentVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UIView *bgNumView0;
@property (nonatomic,strong) UIView *bgNumView1;
@property (nonatomic,strong) UILabel *numLab0;
@property (nonatomic,strong) UILabel *numLab1;
@property (nonatomic,strong) UILabel *messageLab0;
@property (nonatomic,strong) UILabel *messageLab1;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) studentlistHeadView *headView;
@property (nonatomic,strong) NSMutableArray *studentArray;
@end

@implementation StatisticsStudentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"学生名单";
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
    [self.view addSubview:self.bgNumView0];
    [self.view addSubview:self.bgNumView1];
    [self.bgNumView0 addSubview:self.numLab0];
    [self.bgNumView0 addSubview:self.messageLab0];
    [self.bgNumView1 addSubview:self.numLab1];
    [self.bgNumView1 addSubview:self.messageLab1];

    [self.view addSubview:self.tableView];
    
    [self setuplayout];
    
    [self getStudentInfo];
}

-(void)getStudentInfo{
    NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
    NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@"studentInfo.json"];
    NSURL *url=[NSURL fileURLWithPath:path];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    NSString *strs = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];

    self.studentArray = [NSMutableArray new];
    NSArray *arrays = [NSArray yy_modelArrayWithClass:[studentModel class] json:strs];
    NSArray *newArray = [arrays subarrayWithRange:NSMakeRange(20, 300)];
    for (int i = 0; i<newArray.count; i++) {
        studentModel *model = [newArray objectAtIndex:i];
        NSString *name = model.student_name;
        [self.studentArray addObject:name];
    }
    [self.tableView reloadData];
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.bgNumView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(16+88);
        make.left.equalTo(weakSelf.view).offset(20);
        make.width.mas_offset(64);
        make.height.mas_offset(35);
    }];
    [weakSelf.bgNumView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(16+88);
        make.left.equalTo(weakSelf.bgNumView0.mas_right).offset(6);
        make.width.mas_offset(64);
        make.height.mas_offset(35);
    }];
    [weakSelf.numLab0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView0);
        make.centerX.equalTo(weakSelf.bgNumView0);
        make.top.equalTo(weakSelf.bgNumView0).offset(4);
    }];
    [weakSelf.messageLab0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView0);
        make.centerX.equalTo(weakSelf.bgNumView0);
        make.bottom.equalTo(weakSelf.bgNumView0).offset(-4);
    }];
    [weakSelf.numLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView1);
        make.centerX.equalTo(weakSelf.bgNumView1);
        make.top.equalTo(weakSelf.bgNumView1).offset(4);
    }];
    [weakSelf.messageLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView1);
        make.centerX.equalTo(weakSelf.bgNumView1);
        make.bottom.equalTo(weakSelf.bgNumView1).offset(-4);
    }];
}

-(UIView *)bgNumView0
{
    if(!_bgNumView0)
    {
        _bgNumView0 = [UIView new];
        _bgNumView0.backgroundColor = RGBA(0xFF7A33, 0.1);
        _bgNumView0.layer.masksToBounds = true;
        _bgNumView0.layer.cornerRadius = 8;
        _bgNumView0.userInteractionEnabled = true;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgview0click)];
        [_bgNumView0 addGestureRecognizer:singleTap];
    }
    return _bgNumView0;
}

-(UIView *)bgNumView1
{
    if(!_bgNumView1)
    {
        _bgNumView1 = [UIView new];
        _bgNumView1.backgroundColor = RGBA(0xF1F6FB, 1);
        _bgNumView1.layer.masksToBounds = true;
        _bgNumView1.layer.cornerRadius = 8;
        _bgNumView1.userInteractionEnabled = true;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgview1click)];
        [_bgNumView1 addGestureRecognizer:singleTap];
    }
    return _bgNumView1;
}

-(UILabel *)numLab0
{
    if(!_numLab0)
    {
        _numLab0 = [UILabel new];
        _numLab0.textAlignment = NSTextAlignmentCenter;
        _numLab0.font = [UIFont systemFontOfSize:12];
        _numLab0.text = @"19";
        _numLab0.textColor = RGBA(0xFF7A33, 1);
    }
    return _numLab0;
}

-(UILabel *)numLab1
{
    if(!_numLab1)
    {
        _numLab1 = [UILabel new];
        _numLab1.textAlignment = NSTextAlignmentCenter;
        _numLab1.font = [UIFont systemFontOfSize:12];
        _numLab1.text = @"333";
        _numLab1.textColor = RGBA(0x666666, 1);
    }
    return _numLab1;
}

-(UILabel *)messageLab0
{
    if(!_messageLab0)
    {
        _messageLab0 = [UILabel new];
        _messageLab0.textAlignment = NSTextAlignmentCenter;
        _messageLab0.font = [UIFont systemFontOfSize:12];
        _messageLab0.text = @"未审核";
        _messageLab0.textColor = RGBA(0xFF7A33, 1);
    }
    return _messageLab0;
}

-(UILabel *)messageLab1
{
    if(!_messageLab1)
    {
        _messageLab1 = [UILabel new];
        _messageLab1.textAlignment = NSTextAlignmentCenter;
        _messageLab1.font = [UIFont systemFontOfSize:12];
        _messageLab1.text = @"已审核";
        _messageLab1.textColor = RGBA(0x666666, 1);
    }
    return _messageLab1;
}

-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [UITableView new];
        _tableView.backgroundColor = RGBA(0xF1F6FB, 1);
        _tableView.frame = CGRectMake(20, 16+88+35+20, kScreenWidth-40, kScreenHeight-16-88-35-20);
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

-(studentlistHeadView *)headView
{
    if(!_headView)
    {
        _headView = [studentlistHeadView new];
        _headView.backgroundColor = [UIColor whiteColor];
        _headView.frame = CGRectMake(0, 0, kScreenWidth, 50);
    }
    return _headView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.studentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    studentlistCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[studentlistCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.nameLab.text = self.studentArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)bgview0click
{
    self.bgNumView0.backgroundColor = RGBA(0xFF7A33, 0.1);
    self.bgNumView1.backgroundColor = RGBA(0xF1F6FB, 1);
    self.numLab0.textColor = RGBA(0xFF7A33, 1);
    self.messageLab0.textColor = RGBA(0xFF7A33, 1);
    self.numLab1.textColor = RGBA(0x666666, 1);
    self.messageLab1.textColor = RGBA(0x666666, 1);
}

-(void)bgview1click
{
    self.bgNumView1.backgroundColor = RGBA(0xFF7A33, 0.1);
    self.bgNumView0.backgroundColor = RGBA(0xF1F6FB, 1);
    self.numLab1.textColor = RGBA(0xFF7A33, 1);
    self.messageLab1.textColor = RGBA(0xFF7A33, 1);
    self.numLab0.textColor = RGBA(0x666666, 1);
    self.messageLab0.textColor = RGBA(0x666666, 1);
}
@end
