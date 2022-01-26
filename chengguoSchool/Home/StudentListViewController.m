//
//  StudentListViewController.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "StudentListViewController.h"
#import "StudentInfoVC.h"

@interface StudentListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITextField *searchText;
@property (nonatomic,strong) UIButton *searchBtn;

@property (nonatomic,strong) UIView *bgNumView0;
@property (nonatomic,strong) UIView *bgNumView1;
@property (nonatomic,strong) UIView *bgNumView2;
@property (nonatomic,strong) UIView *bgNumView3;

@property (nonatomic,strong) UILabel *numLab0;
@property (nonatomic,strong) UILabel *numLab1;
@property (nonatomic,strong) UILabel *numLab2;
@property (nonatomic,strong) UILabel *numLab3;

@property (nonatomic,strong) UILabel *messageLab0;
@property (nonatomic,strong) UILabel *messageLab1;
@property (nonatomic,strong) UILabel *messageLab2;
@property (nonatomic,strong) UILabel *messageLab3;


@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) studentlistHeadView *headView;
@property (nonatomic,strong) NSMutableArray *studentArray;
@end

@implementation StudentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
    self.navigationItem.title = @"学生管理";
    [self.view addSubview:self.searchText];
    [self.view addSubview:self.searchBtn];
    [self.view addSubview:self.bgNumView0];
    [self.view addSubview:self.bgNumView1];
    [self.view addSubview:self.bgNumView2];
    [self.view addSubview:self.bgNumView3];
    
    [self.bgNumView0 addSubview:self.numLab0];
    [self.bgNumView0 addSubview:self.messageLab0];
    
    [self.bgNumView1 addSubview:self.numLab1];
    [self.bgNumView1 addSubview:self.messageLab1];
    
    [self.bgNumView2 addSubview:self.numLab2];
    [self.bgNumView2 addSubview:self.messageLab2];
    
    [self.bgNumView3 addSubview:self.numLab3];
    [self.bgNumView3 addSubview:self.messageLab3];

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
    NSArray *newArray = [arrays subarrayWithRange:NSMakeRange(200, 200)];
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
    [weakSelf.searchText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(20);
        make.top.equalTo(weakSelf.view).offset(8+88);
        make.height.mas_offset(34);
        make.centerX.equalTo(weakSelf.view);
    }];
    [weakSelf.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(43);
        make.height.mas_offset(22);
        make.centerY.equalTo(weakSelf.searchText);
        make.right.equalTo(weakSelf.searchText.mas_right).offset(-10);
    }];
    
    [weakSelf.bgNumView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.searchText.mas_bottom).offset(16);
        make.left.equalTo(weakSelf.view).offset(20);
        make.width.mas_offset(64);
        make.height.mas_offset(35);
    }];
    [weakSelf.bgNumView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bgNumView0);
        make.left.equalTo(weakSelf.bgNumView0.mas_right).offset(6);
        make.width.mas_offset(64);
        make.height.mas_offset(35);
    }];
    
    [weakSelf.bgNumView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bgNumView0);
        make.left.equalTo(weakSelf.bgNumView1.mas_right).offset(6);
        make.width.mas_offset(64);
        make.height.mas_offset(35);
    }];
    
    [weakSelf.bgNumView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bgNumView0);
        make.left.equalTo(weakSelf.bgNumView2.mas_right).offset(6);
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
    
    [weakSelf.numLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView3);
        make.centerX.equalTo(weakSelf.bgNumView3);
        make.top.equalTo(weakSelf.bgNumView3).offset(4);
    }];
    [weakSelf.messageLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView3);
        make.centerX.equalTo(weakSelf.bgNumView3);
        make.bottom.equalTo(weakSelf.bgNumView3).offset(-4);
    }];
}


#pragma mark - getters

-(UITextField *)searchText
{
    if(!_searchText)
    {
        _searchText = [UITextField new];
        _searchText.layer.masksToBounds = true;
        _searchText.layer.cornerRadius = 34/2;
        _searchText.backgroundColor = [UIColor whiteColor];
        _searchText.layer.borderColor = RGBA(0xE9E9E9, 1).CGColor;
        _searchText.layer.borderWidth = 1;
        _searchText.font = [UIFont systemFontOfSize:14];
        
        //创建左侧视图
        UIImage *im = [UIImage imageNamed:@"home_search"];
        UIImageView *iv = [[UIImageView alloc] initWithImage:im];
        UIView *lv = [[UIView alloc] initWithFrame:CGRectMake(4, 0, 22, 22)];//宽度根据需求进行设置，高度必须大于 textField 的高度
        iv.center = lv.center;
        iv.backgroundColor = [UIColor whiteColor];
        [lv addSubview:iv];

        //设置 textField 的左侧视图
        //设置左侧视图的显示模式
        _searchText.leftViewMode = UITextFieldViewModeAlways;
        _searchText.leftView = lv;
        _searchText.placeholder = @"搜索学生姓名";
    }
    return _searchText;
}

-(UIButton *)searchBtn
{
    if(!_searchBtn)
    {
        _searchBtn = [UIButton new];
        [_searchBtn setTitle:@"搜索" forState:normal];
        _searchBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_searchBtn setTitleColor:RGBA(0xFF7A33, 1) forState:normal];
        _searchBtn.backgroundColor = RGBA(0xFF7A33, 0.3);
        _searchBtn.layer.masksToBounds = true;
        _searchBtn.layer.cornerRadius = 11;
    }
    return _searchBtn;
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


-(UIView *)bgNumView3
{
    if(!_bgNumView3)
    {
        _bgNumView3 = [UIView new];
        _bgNumView3.backgroundColor = RGBA(0xF1F6FB, 1);
        _bgNumView3.layer.masksToBounds = true;
        _bgNumView3.layer.cornerRadius = 8;
        _bgNumView3.userInteractionEnabled = true;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgview3click)];
        [_bgNumView3 addGestureRecognizer:singleTap];
    }
    return _bgNumView3;
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


-(UILabel *)numLab3
{
    if(!_numLab3)
    {
        _numLab3 = [UILabel new];
        _numLab3.textAlignment = NSTextAlignmentCenter;
        _numLab3.font = [UIFont systemFontOfSize:12];
        _numLab3.text = @"333";
        _numLab3.textColor = RGBA(0x666666, 1);
    }
    return _numLab3;
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


-(UILabel *)messageLab3
{
    if(!_messageLab3)
    {
        _messageLab3 = [UILabel new];
        _messageLab3.textAlignment = NSTextAlignmentCenter;
        _messageLab3.font = [UIFont systemFontOfSize:12];
        _messageLab3.text = @"月报";
        _messageLab3.textColor = RGBA(0x666666, 1);
    }
    return _messageLab3;
}


-(void)bgview0click
{
    self.bgNumView0.backgroundColor = RGBA(0xFF7A33, 0.1);
    self.bgNumView1.backgroundColor = RGBA(0xF1F6FB, 1);
    self.bgNumView2.backgroundColor = RGBA(0xF1F6FB, 1);
    self.bgNumView3.backgroundColor = RGBA(0xF1F6FB, 1);
    
    self.numLab0.textColor = RGBA(0xFF7A33, 1);
    self.messageLab0.textColor = RGBA(0xFF7A33, 1);
    
    self.numLab1.textColor = RGBA(0x666666, 1);
    self.messageLab1.textColor = RGBA(0x666666, 1);
    
    self.numLab2.textColor = RGBA(0x666666, 1);
    self.messageLab2.textColor = RGBA(0x666666, 1);
    
    self.numLab3.textColor = RGBA(0x666666, 1);
    self.messageLab3.textColor = RGBA(0x666666, 1);
}

-(void)bgview1click
{
    self.bgNumView1.backgroundColor = RGBA(0xFF7A33, 0.1);
    self.bgNumView0.backgroundColor = RGBA(0xF1F6FB, 1);
    self.bgNumView2.backgroundColor = RGBA(0xF1F6FB, 1);
    self.bgNumView3.backgroundColor = RGBA(0xF1F6FB, 1);
    
    
    self.numLab1.textColor = RGBA(0xFF7A33, 1);
    self.messageLab1.textColor = RGBA(0xFF7A33, 1);
    
    self.numLab0.textColor = RGBA(0x666666, 1);
    self.messageLab0.textColor = RGBA(0x666666, 1);
    
    self.numLab2.textColor = RGBA(0x666666, 1);
    self.messageLab2.textColor = RGBA(0x666666, 1);
    
    self.numLab3.textColor = RGBA(0x666666, 1);
    self.messageLab3.textColor = RGBA(0x666666, 1);
}

-(void)bgview2click
{
    self.bgNumView2.backgroundColor = RGBA(0xFF7A33, 0.1);
    self.bgNumView0.backgroundColor = RGBA(0xF1F6FB, 1);
    self.bgNumView1.backgroundColor = RGBA(0xF1F6FB, 1);
    self.bgNumView3.backgroundColor = RGBA(0xF1F6FB, 1);
    
    self.numLab2.textColor = RGBA(0xFF7A33, 1);
    self.messageLab2.textColor = RGBA(0xFF7A33, 1);
    
    self.numLab0.textColor = RGBA(0x666666, 1);
    self.messageLab0.textColor = RGBA(0x666666, 1);
    
    self.numLab1.textColor = RGBA(0x666666, 1);
    self.messageLab1.textColor = RGBA(0x666666, 1);
    
    self.numLab3.textColor = RGBA(0x666666, 1);
    self.messageLab3.textColor = RGBA(0x666666, 1);
}

-(void)bgview3click
{
    self.bgNumView3.backgroundColor = RGBA(0xFF7A33, 0.1);
    self.bgNumView0.backgroundColor = RGBA(0xF1F6FB, 1);
    self.bgNumView1.backgroundColor = RGBA(0xF1F6FB, 1);
    self.bgNumView2.backgroundColor = RGBA(0xF1F6FB, 1);
    
    self.numLab3.textColor = RGBA(0xFF7A33, 1);
    self.messageLab3.textColor = RGBA(0xFF7A33, 1);
    
    self.numLab0.textColor = RGBA(0x666666, 1);
    self.messageLab0.textColor = RGBA(0x666666, 1);
    
    self.numLab1.textColor = RGBA(0x666666, 1);
    self.messageLab1.textColor = RGBA(0x666666, 1);
    
    self.numLab2.textColor = RGBA(0x666666, 1);
    self.messageLab2.textColor = RGBA(0x666666, 1);
}

-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [UITableView new];
        _tableView.backgroundColor = RGBA(0xF1F6FB, 1);
        _tableView.frame = CGRectMake(20, 88+110, kScreenWidth-40, kScreenHeight-110-88);
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *nameStr = self.studentArray[indexPath.row];
    StudentInfoVC *vc = [StudentInfoVC new];
    vc.nameStr = nameStr.copy;
    [self.navigationController pushViewController:vc animated:true];
}

@end
