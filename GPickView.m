//
//  GPickView.m
//  Gengmiao_IOS
//
//  Created by MJN on 16/3/24.
//  Copyright © 2016年 chenzb. All rights reserved.
//

#import "GPickView.h"
@interface GPickView()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) UIPickerView *mPickView;

@property (nonatomic,strong) NSArray *mDataSource;

@property (nonatomic,strong) UIView *mHeadView;

@property (nonatomic,strong) UIButton *mCancelBtn;

@property (nonatomic,strong) UIButton *mConfirmBtn;

@property (nonatomic,strong) NSString *mSelecStr;

@property (nonatomic,strong) UIView *mPartView;

@end

@implementation GPickView


+ (instancetype)initPickViewWithDataSource:(NSArray *)arr_ WithSelecBlock:(void (^)(NSString *type))mSelecBlock{
    GPickView  *pickView=[[GPickView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, K_SCREEN_HEIGHT)];
    pickView.mSelecStrBlock = mSelecBlock;
    pickView.mDataSource = [NSArray arrayWithArray:arr_];
    pickView.mSelecStr = [pickView.mDataSource objectAtIndex:0];
    return pickView;
    
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor=[UIColor orangeColor];
         self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        self.mPartView = [[UIView alloc]initWithFrame:CGRectMake(0, K_SCREEN_HEIGHT, K_SCREEN_WIDTH, 150)];
        self.mPartView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.mPartView];
        
        self.mPickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 30 , self.mPartView.width, 120)];
        [self.mPartView addSubview:self.mPickView];
        self.mPickView.delegate = self;
        self.mPickView.dataSource = self;
        
        self.mHeadView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.mPartView.width, 30)];
        self.mHeadView.backgroundColor = K_COLOR_THEME_COLOR;
        [self.mPartView addSubview:self.mHeadView];
        
        self.mCancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
        [self.mCancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.mCancelBtn addTarget:self action:@selector(mCancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.mHeadView addSubview:self.mCancelBtn];
        
        self.mConfirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.width-60, 0, 60, 30)];
        [self.mConfirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.mConfirmBtn addTarget:self action:@selector(mConfirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.mHeadView addSubview:self.mConfirmBtn];
        
        UITapGestureRecognizer *mtap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hide)];
        [self addGestureRecognizer:mtap];
        
    }
    return self;
}

- (void)show {
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
    __weak typeof(self) weakSelf = self;
    
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.mPartView.frame = CGRectMake(0, K_SCREEN_HEIGHT-150, K_SCREEN_WIDTH, 150) ;
    }];
}


- (void)hide {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.alpha = 0;
        weakSelf.mPartView.frame = CGRectMake(0, K_SCREEN_HEIGHT, K_SCREEN_WIDTH, 240) ;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}
- (void)mCancelBtnClick {
    [self hide];
}

- (void)mConfirmBtnClick {
    if (_mSelecStrBlock) {
        self.mSelecStrBlock(self.mSelecStr);
    }
    [self hide];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return self.mDataSource.count;
            break;

        default:
            return 0;
            break;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return [self.mDataSource objectAtIndex:row];
            break;

        default:
            return  @"";
            break;
    }
}


#pragma mark - UIPickerViewDelegate

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.minimumScaleFactor = 8.0;
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    switch (component) {
        case 0:{

            self.mSelecStr = [self.mDataSource objectAtIndex:row];
        }
        default:
            break;
    }
}


@end


