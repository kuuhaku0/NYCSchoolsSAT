//
//  NYCSchoolsAPIService.swift
//  20190211-TylerZhao-NYCSchools-Swift
//
//  Created by Tyler Zhao on 2/11/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

import Foundation

class NYCSchoolsAPIService {
    static let shared = NYCSchoolsAPIService()
    private init() {}
    
    func getSchoolsList(forBoro boroInitial: String, completionHandler: @escaping ([NYCSchool]?) -> Void) {
        let urlStr = "https://data.cityofnewyork.us/resource/97mf-9njv.json?boro=\(boroInitial)"
        guard let url = URL(string: urlStr) else {
            print(AppError.badURL(rawURLStr: urlStr))
            completionHandler(nil)
            return
        }
        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30)
        let completion = { (data: Data) -> Void in
            do {
                let schoolsInfo = try JSONDecoder().decode([NYCSchool].self, from: data)
                completionHandler(schoolsInfo)
            }
            catch {
                completionHandler(nil)
            }
        }
        NetworkManager.manager.performDataTask(with: request,
                                               completionHandler: completion,
                                               errorHandler: { print($0.localizedDescription) })
    }
}
