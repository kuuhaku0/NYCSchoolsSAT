//
//  SchoolSATDetailViewController.swift
//  20190211-TylerZhao-NYCSchools-Swift
//
//  Created by Tyler Zhao on 2/11/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

import UIKit

class SchoolSATDetailViewController: UIViewController {
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!
    @IBOutlet weak var totalAverageScoreLabel: UILabel!
    
    var viewModel: SchoolSATDetailsViewModel!
    
    override func viewDidLoad() {
        bindViewModel()
    }
    
    func bindViewModel() {
        schoolNameLabel.text = viewModel.schoolDetails.school_name
        
        viewModel.dataReceived = { [weak self] in
            self?.setLabelTexts()
        }
        viewModel.getDataFailed = { [weak self] in
            self?.displayError()
        }
    }
    
    func setLabelTexts() {
        readingScoreLabel.text = viewModel.readingScore
        writingScoreLabel.text = viewModel.writingScore
        mathScoreLabel.text = viewModel.mathScore
        totalAverageScoreLabel.text = viewModel.totalAverageScore
    }
    
    func displayError() {
        //Handle Error
    }
}
