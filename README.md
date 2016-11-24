# a-simple-pickerView-select-tool

a simple pickerView record 

/**
 *  初始化方法
 *
 *  @param arr_ 要使用的数组
 *  @param type 选中的数据
 *  @return   用于显示的pickerView
 */
 
+ (instancetype)initPickViewWithDataSource:(NSArray *)arr_ WithSelecBlock:(void (^)(NSString *type))mSelecBlock;

- (void)show;

使用方法：

GPickView *pickView=[GPickView initPickViewWithDataSource:self.mReturnTypeArr WithSelecBlock:^(NSString *type) {
        //拿到选中数据type，写逻辑
        
    }];
    
    
[pickView show];

使用效果：
/Users/a1/Pictures/照片 图库.photoslibrary/Thumbnails/2016/11/24/20161124-030934/aZUcJFxjRSui7yIzOVg8Eg/thumb_IMG_1006_1024.jpg
总结：内容比较简单，想着以后可能会用到就记录一下😄
