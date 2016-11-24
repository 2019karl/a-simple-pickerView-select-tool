# a-simple-pickerView-select-tool
a simple pickerView record 

/**
 *  初始化方法
 *
 *  @param arr_ 要使用的数组
 *  @param type 选中的数据
 *  @return
 */
+ (instancetype)initPickViewWithDataSource:(NSArray *)arr_ WithSelecBlock:(void (^)(NSString *type))mSelecBlock;

- (void)show;

使用方法：

GPickView *pickView=[GPickView initPickViewWithDataSource:self.mReturnTypeArr WithSelecBlock:^(NSString *type) {
        //拿到选中数据type，写逻辑
        
    }];
    
    
[pickView show];
