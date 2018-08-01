//
//  ViewController.m
//  CSProgressHUD
//
//  Created by cs on 2018/7/30.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "ViewController.h"
#import "CSModel.h"
#import "AlertUtils.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
/** tableView */
@property(nonatomic, strong)UITableView *tableView;
/** data source */
@property(nonatomic, strong)NSMutableArray *datas;
@end

static NSString *CellID = @"CellID";

// 提示类型
static NSString *successHudType = @"successHudType";  // 成功提示类型
static NSString *warmingHudType = @"warmingHudType";  // 警告提示类型
static NSString *errorHudType = @"errorHudType";  // 错误提示类型
static NSString *loadingHudType = @"loadingHudType";  // 加载提示类型
static NSString *textHudType = @"textHudType";  // 信息提示类型

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self drawUI];
    [self setupInit];
}

#pragma mark - drawUI

- (void)drawUI {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - setup

- (void)setupInit {
    CSModel *item1 = [CSModel modelWithName:@"成功提示" hudType:CSHUDTypeSuccess code:successHudType];
    CSModel *item2 = [CSModel modelWithName:@"警告提示" hudType:CSHUDTypeWarning code:warmingHudType];
    CSModel *item3 = [CSModel modelWithName:@"错误提示" hudType:CSHUDTypeError code:errorHudType];
    CSModel *item4 = [CSModel modelWithName:@"信息文字提示" hudType:CSHudTypeMessage code:textHudType];
    CSModel *item5 = [CSModel modelWithName:@"加载中..." hudType:CSHUDTypeLoading code:loadingHudType];
    
    [self.datas addObject:item1];
    [self.datas addObject:item2];
    [self.datas addObject:item3];
    [self.datas addObject:item4];
    [self.datas addObject:item5];
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CSModel *model = [self.datas objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
    }
    cell.textLabel.text = model.name;
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CSModel *model = [self.datas objectAtIndex:indexPath.row];
    if (model.hudType == CSHUDTypeSuccess) {
        [AlertUtils success:model.name];
    } else if (model.hudType == CSHUDTypeWarning) {
        [AlertUtils warning:model.name];
    } else if (model.hudType == CSHUDTypeError) {
        [AlertUtils error:model.name];
    } else if (model.hudType == CSHudTypeMessage) {
        [AlertUtils message:model.name];
    } else if (model.hudType == CSHUDTypeLoading) {
        MBProgressHUD *hud = [AlertUtils info:model.name toView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:true];
        });
    }
}

#pragma mark - lazy

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = nil;
    }
    return _tableView;
}

- (NSMutableArray *)datas {
    if (_datas == nil) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

@end
