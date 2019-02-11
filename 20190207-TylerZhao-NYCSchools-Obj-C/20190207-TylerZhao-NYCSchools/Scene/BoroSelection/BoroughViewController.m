//
//  ViewController.m
//  20190207-TylerZhao-NYCSchools
//
//  Created by Tyler Zhao on 2/7/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

#import "BoroughViewController.h"
#import "BoroughViewModel.h"

@interface BoroughViewController ()
@property (nonatomic) BoroughViewModel *viewModel;
@end

@implementation BoroughViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = BoroughViewModel.new;
    self.title = @"Borough";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    BoroughModel *boro = [self.viewModel boroForCell:indexPath.row];
    cell.textLabel.text = boro.boroName;
    cell.detailTextLabel.text = boro.initial;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.numberOfBoro;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SchoolsViewModel *vm = [[SchoolsViewModel alloc]initWithBoroInitial: [self.viewModel boroForCell:indexPath.row].initial];
    SchoolsViewController *vc = SchoolsViewController.new;
    vc.viewModel = vm;
    vc.title = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [self.navigationController pushViewController:vc animated:true];
}

@end
