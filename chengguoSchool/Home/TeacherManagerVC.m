//
//  TeacherManagerVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "TeacherManagerVC.h"
#import "TeacherHeadView.h"
#import "TeacherVC0.h"
#import "TeacherVC1.h"
#import "TeacherVC2.h"
#import "TeacherVC3.h"

@interface TeacherManagerVC ()
@property (nonatomic,strong) TeacherHeadView *headView;
@property (nonatomic,strong) TeacherVC0 *vc0;
@property (nonatomic,strong) TeacherVC1 *vc1;
@property (nonatomic,strong) TeacherVC2 *vc2;
@property (nonatomic,strong) TeacherVC3 *vc3;
@end

@implementation TeacherManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"教师任务";
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
    [self.view addSubview:self.headView];
    

    self.vc0 = [TeacherVC0 new];
    [self.view addSubview:self.vc0.view];
    [self addChildViewController:self.vc0];
    
    self.vc1 = [TeacherVC1 new];
    [self.vc1.view setHidden:true];
    [self addChildViewController:self.vc1];
    [self.view addSubview:self.vc1.view];
    
    self.vc2 = [TeacherVC2 new];
    [self.vc2.view setHidden:true];
    [self addChildViewController:self.vc2];
    [self.view addSubview:self.vc2.view];
    
    self.vc3 = [TeacherVC3 new];
    [self.vc3.view setHidden:true];
    [self addChildViewController:self.vc3];
    [self.view addSubview:self.vc3.view];
    

    self.vc0.view.frame = CGRectMake(0, 40+88, kScreenWidth, kScreenHeight-88-40);
    self.vc1.view.frame = CGRectMake(0, 40+88, kScreenWidth, kScreenHeight-88-40);
    self.vc2.view.frame = CGRectMake(0, 40+88, kScreenWidth, kScreenHeight-88-40);
    self.vc3.view.frame = CGRectMake(0, 40+88, kScreenWidth, kScreenHeight-88-40);
    
    [self.vc0.view setHidden:false];
    [self.vc1.view setHidden:true];
    [self.vc2.view setHidden:true];
    [self.vc3.view setHidden:true];
}

#pragma mark - getters

-(TeacherHeadView *)headView
{
    if(!_headView)
    {
        _headView = [TeacherHeadView new];
        _headView.frame = CGRectMake(0, 88, kScreenWidth, 40);
        _headView.backgroundColor = RGBA(0xF1F6FB, 1);
        [_headView.headBtn0 addTarget:self action:@selector(headbtn0Click) forControlEvents:UIControlEventTouchUpInside];
        [_headView.headBtn1 addTarget:self action:@selector(headbtn1Click) forControlEvents:UIControlEventTouchUpInside];
        [_headView.headBtn2 addTarget:self action:@selector(headbtn2Click) forControlEvents:UIControlEventTouchUpInside];
        [_headView.headBtn3 addTarget:self action:@selector(headbtn3Click) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _headView;
}


-(void)headbtn0Click
{
    [self.headView.headBtn0 setTitleColor:RGBA(0xFF7A33, 1) forState:normal];
    [self.headView.headBtn1 setTitleColor:RGBA(0x666666, 1) forState:normal];
    [self.headView.headBtn2 setTitleColor:RGBA(0x666666, 1) forState:normal];
    [self.headView.headBtn3 setTitleColor:RGBA(0x666666, 1) forState:normal];
    
    [self.vc0.view setHidden:false];
    [self.vc1.view setHidden:true];
    [self.vc2.view setHidden:true];
    [self.vc3.view setHidden:true];
}

-(void)headbtn1Click
{
    [self.headView.headBtn1 setTitleColor:RGBA(0xFF7A33, 1) forState:normal];
    [self.headView.headBtn0 setTitleColor:RGBA(0x666666, 1) forState:normal];
    [self.headView.headBtn2 setTitleColor:RGBA(0x666666, 1) forState:normal];
    [self.headView.headBtn3 setTitleColor:RGBA(0x666666, 1) forState:normal];
    
    [self.vc0.view setHidden:true];
    [self.vc1.view setHidden:false];
    [self.vc2.view setHidden:true];
    [self.vc3.view setHidden:true];
}

-(void)headbtn2Click
{
    [self.headView.headBtn2 setTitleColor:RGBA(0xFF7A33, 1) forState:normal];
    [self.headView.headBtn0 setTitleColor:RGBA(0x666666, 1) forState:normal];
    [self.headView.headBtn1 setTitleColor:RGBA(0x666666, 1) forState:normal];
    [self.headView.headBtn3 setTitleColor:RGBA(0x666666, 1) forState:normal];
    
    [self.vc0.view setHidden:true];
    [self.vc1.view setHidden:true];
    [self.vc2.view setHidden:false];
    [self.vc3.view setHidden:true];
}

-(void)headbtn3Click
{
    [self.headView.headBtn3 setTitleColor:RGBA(0xFF7A33, 1) forState:normal];
    [self.headView.headBtn0 setTitleColor:RGBA(0x666666, 1) forState:normal];
    [self.headView.headBtn1 setTitleColor:RGBA(0x666666, 1) forState:normal];
    [self.headView.headBtn2 setTitleColor:RGBA(0x666666, 1) forState:normal];
    
    [self.vc0.view setHidden:true];
    [self.vc1.view setHidden:true];
    [self.vc2.view setHidden:true];
    [self.vc3.view setHidden:false];
}



@end
