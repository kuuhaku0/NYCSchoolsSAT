//
//  SchoolSATDetailsViewModel.swift
//  20190211-TylerZhao-NYCSchools-Swift
//
//  Created by Tyler Zhao on 2/11/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

import Foundation

class SchoolSATDetailsViewModel {
    var totalAverageScore: String = ""
    var mathScore: String = ""
    var readingScore: String = ""
    var writingScore: String = ""
    let schoolDetails: NYCSchool
    
    var dataReceived: (()->Void)?
    var getDataFailed: (()->Void)?

    init(schoolDBN: String, schoolDetails: NYCSchool) {
        self.schoolDetails = schoolDetails
        NYCSchoolsAPIService.shared.getSATInfo(forSchool: schoolDBN) { (data) in
            if let schoolSAT = data {
                self.mathScore = schoolSAT.sat_math_avg_score
                self.readingScore = schoolSAT.sat_critical_reading_avg_score
                self.writingScore = schoolSAT.sat_writing_avg_score
                
                let math = Int(self.mathScore) ?? 0
                let reading = Int(self.readingScore) ?? 0
                let writing = Int(self.writingScore) ?? 0
                let total = math + reading + writing
                self.totalAverageScore = String(total)
                self.dataReceived?()
            } else {
                self.getDataFailed?()
            }
        }
    }
    
}
