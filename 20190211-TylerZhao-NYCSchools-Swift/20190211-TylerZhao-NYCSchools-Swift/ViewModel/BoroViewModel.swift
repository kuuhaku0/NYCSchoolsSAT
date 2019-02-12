//
//  BoroViewModel.swift
//  20190211-TylerZhao-NYCSchools-Swift
//
//  Created by Tyler Zhao on 2/11/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

import Foundation

struct BoroModel {
    let initial: String
    let name: String
}

struct BoroViewModel {
    private let rawModel = [BoroModel(initial: "M", name: "Manhattan"),
                            BoroModel(initial: "K", name: "Brooklyn"),
                            BoroModel(initial: "Q", name: "Queens"),
                            BoroModel(initial: "X", name: "Bronx"),
                            BoroModel(initial: "R", name: "Staten Island")]
  
    let title = "Boroughs"
    
    func boroForRowAt(index: Int) -> BoroModel? {
        guard rawModel.indices.contains(index) else { return nil }
        return rawModel[index]
    }
    
    func numerOfRows() -> Int {
        return rawModel.count
    }
}
