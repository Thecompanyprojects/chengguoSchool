//
//  AuditlistVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "AuditlistVC.h"

@interface AuditlistVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UIView *bgNumView0;
@property (nonatomic,strong) UIView *bgNumView1;
@property (nonatomic,strong) UIView *bgNumView2;
@property (nonatomic,strong) UILabel *numLab0;
@property (nonatomic,strong) UILabel *numLab1;
@property (nonatomic,strong) UILabel *numLab2;
@property (nonatomic,strong) UILabel *messageLab0;
@property (nonatomic,strong) UILabel *messageLab1;
@property (nonatomic,strong) UILabel *messageLab2;
@property (nonatomic,strong) UIButton *clearBtn;
@property (nonatomic,strong) UIButton *sendBtn0;
@property (nonatomic,strong) UIButton *sendBtn1;
@property (nonatomic,strong) UIButton *typeBtn0;
@property (nonatomic,strong) UIButton *typeBtn1;
@property (nonatomic,strong) UIButton *typeBtn2;
@property (nonatomic,strong) UIButton *timeBtn;
@property (nonatomic,strong) UIButton *chooseBtn;

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) studentlistHeadView *headView;
@property (nonatomic,strong) NSMutableArray *studentArray;
@end

@implementation AuditlistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"报告审核与批阅";
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
    [self.view addSubview:self.bgNumView0];
    [self.view addSubview:self.bgNumView1];
    [self.view addSubview:self.bgNumView2];
    
    [self.bgNumView0 addSubview:self.numLab0];
    [self.bgNumView0 addSubview:self.messageLab0];
    
    [self.bgNumView1 addSubview:self.numLab1];
    [self.bgNumView1 addSubview:self.messageLab1];
    
    [self.bgNumView2 addSubview:self.numLab2];
    [self.bgNumView2 addSubview:self.messageLab2];
    
    [self.view addSubview:self.clearBtn];
    [self.view addSubview:self.sendBtn0];
    [self.view addSubview:self.sendBtn1];
    
    [self.view addSubview:self.typeBtn0];
    [self.view addSubview:self.typeBtn1];
    [self.view addSubview:self.typeBtn2];
    
    [self.view addSubview:self.timeBtn];
    [self.view addSubview:self.chooseBtn];
    
    [self setuplayout];
    [self.view addSubview:self.tableView];
    
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
    
    [weakSelf.bgNumView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view).offset(16+88);
        make.left.equalTo(weakSelf.bgNumView1.mas_right).offset(6);
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
    [weakSelf.numLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView2);
        make.centerX.equalTo(weakSelf.bgNumView2);
        make.top.equalTo(weakSelf.bgNumView2).offset(4);
    }];
    [weakSelf.messageLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView2);
        make.centerX.equalTo(weakSelf.bgNumView2);
        make.bottom.equalTo(weakSelf.bgNumView2).offset(-4);
    }];
    [weakSelf.clearBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(20);
        make.right.equalTo(weakSelf.view).offset(-20);
        make.centerY.equalTo(weakSelf.bgNumView0);
        make.width.mas_offset(68);
    }];
    [weakSelf.sendBtn0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.bgNumView0);
        make.height.mas_offset(20);
        make.width.mas_offset(46);
        make.top.equalTo(weakSelf.bgNumView0.mas_bottom).offset(16);
    }];
    [weakSelf.sendBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.bgNumView1);
        make.height.mas_offset(20);
        make.width.mas_offset(46);
        make.top.equalTo(weakSelf.bgNumView0.mas_bottom).offset(16);
    }];
    
    [weakSelf.typeBtn0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.bgNumView0);
        make.height.mas_offset(20);
        make.width.mas_offset(46);
        make.top.equalTo(weakSelf.sendBtn0.mas_bottom).offset(16);
    }];
    
    [weakSelf.typeBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.bgNumView1);
        make.height.mas_offset(20);
        make.width.mas_offset(46);
        make.top.equalTo(weakSelf.sendBtn0.mas_bottom).offset(16);
    }];
    
    [weakSelf.typeBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.bgNumView2);
        make.height.mas_offset(20);
        make.width.mas_offset(46);
        make.top.equalTo(weakSelf.sendBtn0.mas_bottom).offset(16);
    }];
    
    [weakSelf.timeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.typeBtn2.mas_right).offset(16);
        make.height.mas_offset(20);
        make.width.mas_offset(46);
        make.top.equalTo(weakSelf.sendBtn0.mas_bottom).offset(16);
    }];
    
    [weakSelf.chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(20);
        make.width.mas_offset(89);
        make.left.equalTo(weakSelf.timeBtn.mas_right).offset(6);
        make.top.equalTo(weakSelf.sendBtn0.mas_bottom).offset(16);
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


-(UIView *)bgNumView2
{
    if(!_bgNumView2)
    {
        _bgNumView2 = [UIView new];
        _bgNumView2.backgroundColor = RGBA(0xF1F6FB, 1);
        _bgNumView2.layer.masksToBounds = true;
        _bgNumView2.layer.cornerRadius = 8;
        _bgNumView2.userInteractionEnabled = true;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgview2click)];
        [_bgNumView2 addGestureRecognizer:singleTap];
    }
    return _bgNumView2;
}

-(UILabel *)numLab0
{
    if(!_numLab0)
    {
        _numLab0 = [UILabel new];
        _numLab0.textAlignment = NSTextAlignmentCenter;
        _numLab0.font = [UIFont systemFontOfSize:12];
        _numLab0.text = @"16";
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
        _numLab1.text = @"221";
        _numLab1.textColor = RGBA(0x666666, 1);
    }
    return _numLab1;
}


-(UILabel *)numLab2
{
    if(!_numLab2)
    {
        _numLab2 = [UILabel new];
        _numLab2.textAlignment = NSTextAlignmentCenter;
        _numLab2.font = [UIFont systemFontOfSize:12];
        _numLab2.text = @"333";
        _numLab2.textColor = RGBA(0x666666, 1);
    }
    return _numLab2;
}

-(UILabel *)messageLab0
{
    if(!_messageLab0)
    {
        _messageLab0 = [UILabel new];
        _messageLab0.textAlignment = NSTextAlignmentCenter;
        _messageLab0.font = [UIFont systemFontOfSize:12];
        _messageLab0.text = @"日报";
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
        _messageLab1.text = @"周报";
        _messageLab1.textColor = RGBA(0x666666, 1);
    }
    return _messageLab1;
}


-(UILabel *)messageLab2
{
    if(!_messageLab2)
    {
        _messageLab2 = [UILabel new];
        _messageLab2.textAlignment = NSTextAlignmentCenter;
        _messageLab2.font = [UIFont systemFontOfSize:12];
        _messageLab2.text = @"月报";
        _messageLab2.textColor = RGBA(0x666666, 1);
    }
    return _messageLab2;
}

-(UIButton *)clearBtn
{
    if(!_clearBtn)
    {
        _clearBtn = [UIButton new];
        [_clearBtn setTitleColor:RGBA(0xFF7A33, 1) forState:normal];
        _clearBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_clearBtn setTitle:@"一键提醒" forState:normal];
        [_clearBtn setImage:[UIImage imageNamed:@"提醒"] forState:normal];
    }
    return _clearBtn;
}


-(void)bgview0click
{
    self.bgNumView0.backgroundColor = RGBA(0xFF7A33, 0.1);
    self.bgNumView1.backgroundColor = RGBA(0xF1F6FB, 1);
    self.bgNumView2.backgroundColor = RGBA(0xF1F6FB, 1);
    
    self.numLab0.textColor = RGBA(0xFF7A33, 1);
    self.messageLab0.textColor = RGBA(0xFF7A33, 1);
    
    self.numLab1.textColor = RGBA(0x666666, 1);
    self.messageLab1.textColor = RGBA(0x666666, 1);
    
    self.numLab2.textColor = RGBA(0x666666, 1);
    self.messageLab2.textColor = RGBA(0x666666, 1);
}

-(void)bgview1click
{
    self.bgNumView1.backgroundColor = RGBA(0xFF7A33, 0.1);
    self.bgNumView0.backgroundColor = RGBA(0xF1F6FB, 1);
    self.bgNumView2.backgroundColor = RGBA(0xF1F6FB, 1);
    
    self.numLab1.textColor = RGBA(0xFF7A33, 1);
    self.messageLab1.textColor = RGBA(0xFF7A33, 1);
    
    self.numLab0.textColor = RGBA(0x666666, 1);
    self.messageLab0.textColor = RGBA(0x666666, 1);
    
    self.numLab2.textColor = RGBA(0x666666, 1);
    self.messageLab2.textColor = RGBA(0x666666, 1);
}

-(void)bgview2click
{
    self.bgNumView2.backgroundColor = RGBA(0xFF7A33, 0.1);
    self.bgNumView0.backgroundColor = RGBA(0xF1F6FB, 1);
    self.bgNumView1.backgroundColor = RGBA(0xF1F6FB, 1);
    
    self.numLab2.textColor = RGBA(0xFF7A33, 1);
    self.messageLab2.textColor = RGBA(0xFF7A33, 1);
    
    self.numLab0.textColor = RGBA(0x666666, 1);
    self.messageLab0.textColor = RGBA(0x666666, 1);
    
    self.numLab1.textColor = RGBA(0x666666, 1);
    self.messageLab1.textColor = RGBA(0x666666, 1);
}

-(UIButton *)sendBtn0
{
    if(!_sendBtn0)
    {
        _sendBtn0 = [UIButton new];
        [_sendBtn0 setTitleColor:RGBA(0xFF7A33, 1) forState:normal];
        _sendBtn0.titleLabel.font = [UIFont systemFontOfSize:12];
        [_sendBtn0 setTitle:@"未提交" forState:normal];
    }
    return _sendBtn0;
}

-(UIButton *)sendBtn1
{
    if(!_sendBtn1)
    {
        _sendBtn1 = [UIButton new];
        [_sendBtn1 setTitleColor:RGBA(0x666666, 1) forState:normal];
        _sendBtn1.titleLabel.font = [UIFont systemFontOfSize:12];
        [_sendBtn1 setTitle:@"已提交" forState:normal];
    }
    return _sendBtn1;
}

-(UIButton *)typeBtn0
{
    if(!_typeBtn0)
    {
        _typeBtn0 = [UIButton new];
        [_typeBtn0 setTitleColor:RGBA(0xFF7A33, 1) forState:normal];
        _typeBtn0.titleLabel.font = [UIFont systemFontOfSize:12];
        [_typeBtn0 setTitle:@"已阅" forState:normal];
    }
    return _typeBtn0;
}

-(UIButton *)typeBtn1
{
    if(!_typeBtn1)
    {
        _typeBtn1 = [UIButton new];
        [_typeBtn1 setTitleColor:RGBA(0x666666, 1) forState:normal];
        _typeBtn1.titleLabel.font = [UIFont systemFontOfSize:12];
        [_typeBtn1 setTitle:@"未阅" forState:normal];
    }
    return _typeBtn1;
}

-(UIButton *)typeBtn2
{
    if(!_typeBtn2)
    {
        _typeBtn2 = [UIButton new];
        [_typeBtn2 setTitleColor:RGBA(0x666666, 1) forState:normal];
        _typeBtn2.titleLabel.font = [UIFont systemFontOfSize:12];
        [_typeBtn2 setTitle:@"驳回" forState:normal];
    }
    return _typeBtn2;
}

-(UIButton *)timeBtn
{
    if(!_timeBtn)
    {
        _timeBtn = [UIButton new];
        [_timeBtn setTitleColor:RGBA(0x666666, 1) forState:normal];
        _timeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_timeBtn setTitle:@"时间" forState:normal];
    }
    return _timeBtn;
}

-(UIButton *)chooseBtn
{
    if(!_chooseBtn)
    {
        _chooseBtn = [UIButton new];
        _chooseBtn.layer.masksToBounds = true;
        _chooseBtn.layer.cornerRadius = 4;
        _chooseBtn.layer.borderWidth = 1;
        _chooseBtn.layer.borderColor = RGBA(0x666666, 1).CGColor;
        _chooseBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_chooseBtn setTitleColor:RGBA(0x666666, 1) forState:normal];
        [_chooseBtn setTitle:[Public getTodayTimes] forState:normal];
    }
    return _chooseBtn;
}


-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [UITableView new];
        _tableView.backgroundColor = RGBA(0xF1F6FB, 1);
        _tableView.frame = CGRectMake(20, 88+140, kScreenWidth-40, kScreenHeight-140-88);
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
@end
