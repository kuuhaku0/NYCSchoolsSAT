//
//  ViewController.swift
//  20190211-TylerZhao-NYCSchools-Swift
//
//  Created by Tyler Zhao on 2/11/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

import UIKit

class BoroViewController: UITableViewController {
    
    let viewModel: BoroViewModel
    
    init(viewModel: BoroViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.title = viewModel.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // No need to dequeue since we know how many cells we can have at max.
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.boroForRowAt(index: indexPath.row)?.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numerOfRows()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBoro = self.viewModel.boroForRowAt(index: indexPath.row)
        guard let boro = selectedBoro else { return }
        let viewModel = SchoolListViewModel(selectedBoro: boro)
        let vc = SchoolListViewController(viewModel: viewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
}

