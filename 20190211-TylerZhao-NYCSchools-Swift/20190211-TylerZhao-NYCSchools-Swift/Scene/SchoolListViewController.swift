//
//  SchoolListViewController.swift
//  20190211-TylerZhao-NYCSchools-Swift
//
//  Created by Tyler Zhao on 2/11/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

import UIKit

class SchoolListViewController: UITableViewController {
    
    let viewModel: SchoolListViewModel
    private let cellId = "SchoolCell"
    
    init(viewModel: SchoolListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindViewModel()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    func bindViewModel() {
        title = viewModel.selectedBoro
        
        viewModel.dataReceived = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.failedToGetData = { [weak self] in
            self?.displayError()
        }
    }
    
    func displayError() {
        // Handle any errors
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfSchools()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let school = viewModel.schoolForRowAt(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = school?.school_name
        return cell
    }
}
