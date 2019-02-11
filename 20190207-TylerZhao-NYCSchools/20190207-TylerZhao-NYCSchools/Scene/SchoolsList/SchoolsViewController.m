//
//  SchoolsViewController.m
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/10/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import "SchoolsViewController.h"

@interface SchoolsViewController ()
@end

@implementation SchoolsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"cell"];
    [self bindViewModel];
}

- (void)bindViewModel {
    __weak typeof(self) weakSelf = self;
    self.viewModel.dataReceived = ^{
        [weakSelf.tableView reloadData];
    };
    self.viewModel.getDataFailed = ^{
        // Display Error
        // Handle Error
    };
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfSchools];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NYCSchool *school = [self.viewModel schoolForRowAt:indexPath.row];
    cell.textLabel.text = school.schoolName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NYCSchool *schoolData = [self.viewModel schoolForRowAt:indexPath.row];
    SchoolDetailModel *detailModel = SchoolDetailModel.new;
    detailModel.schoolGeneralInfo = schoolData;
    SATScoreDetailViewModel *vm = [[SATScoreDetailViewModel alloc]initWithDetailModel:detailModel];
    UIStoryboard *detailVCStoryboard = [UIStoryboard storyboardWithName:@"SATScoreDetailsViewController" bundle:nil];
    SATScoreDetailsViewController *vc = [detailVCStoryboard instantiateViewControllerWithIdentifier:@"SATScoreDetailsViewController"];
    vc.viewModel = vm;
    [self.navigationController pushViewController:vc animated:true];
}

@end
