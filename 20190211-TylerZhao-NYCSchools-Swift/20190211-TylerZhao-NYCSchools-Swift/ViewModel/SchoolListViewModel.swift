//
//  SchoolListViewModel.swift
//  20190211-TylerZhao-NYCSchools-Swift
//
//  Created by Tyler Zhao on 2/11/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

import Foundation

class SchoolListViewModel {
    private var rawModel: [NYCSchool] = []
    let selectedBoro: String
    
    var dataReceived: (() -> Void)?
    var failedToGetData: (()-> Void)?
    
    init(selectedBoro: BoroModel) {
        self.selectedBoro = selectedBoro.name
        NYCSchoolsAPIService.shared.getSchoolsList(forBoro: selectedBoro.initial) { (schoolsList) in
            if let data = schoolsList {
                self.rawModel = data.sorted { $0.school_name < $1.school_name }
                self.dataReceived?()
            } else {
                self.failedToGetData?()
            }
        }
    }
    
    func schoolForRowAt(index: Int) -> NYCSchool? {
        guard rawModel.indices.contains(index) else { return nil }
        return rawModel[index]
    }
    
    func numberOfSchools() -> Int {
        return rawModel.count
    }
}
