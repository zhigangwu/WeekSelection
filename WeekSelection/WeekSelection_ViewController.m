//
//  WeekSelection_ViewController.m
//  WeekSelection
//
//  Created by 吴志刚 on 2019/3/6.
//  Copyright © 2019 HJ. All rights reserved.
//

#import "WeekSelection_ViewController.h"

#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ( [UIScreen mainScreen].bounds.size.height)

@interface WeekSelection_ViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
    NSArray *weekArray;
}

@end

@implementation WeekSelection_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.lightGrayColor;
    
    weekArray = @[@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六"];
    
    if (self.selectedWeekArray.count == 0) {
        self.selectedWeekArray = [NSMutableArray array];
    }
    
    self.navigationItem.hidesBackButton = true;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(submit)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, 100, WIDTH - 30, 308)];
    [tableView.layer setCornerRadius:5];
    tableView.layer.masksToBounds = YES;
    tableView.backgroundColor = UIColor.whiteColor;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return weekArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = weekArray[indexPath.row];
    
    if ([self.selectedWeekArray containsObject:[NSString stringWithFormat:@"%ld",indexPath.row]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.selectedWeekArray containsObject:[NSString stringWithFormat:@"%ld",indexPath.row]]) {
        [self.selectedWeekArray removeObject:[NSString stringWithFormat:@"%ld",indexPath.row]];
    } else {
        [self.selectedWeekArray addObject:[NSString stringWithFormat:@"%ld",indexPath.row]];
    }
    [tableView reloadData];
}

- (void)submit {
    if ([self respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.delegate selectedWeek:self.selectedWeekArray];
    }
    [self.navigationController popViewControllerAnimated:true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
