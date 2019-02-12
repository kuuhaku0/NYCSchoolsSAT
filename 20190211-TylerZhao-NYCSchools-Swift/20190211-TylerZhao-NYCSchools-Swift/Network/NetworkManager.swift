//
//  NetworkManager.swift
//  20190211-TylerZhao-NYCSchools-Swift
//
//  Created by Tyler Zhao on 2/11/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

import Foundation

enum AppError: Error {
    case noData
    case noInternet
    case urlError(rawError: URLError)
    case otherError(rawError: Error)
    case badURL(rawURLStr: String)
}

struct NetworkManager {
    private init() {}
    static let manager = NetworkManager()
    private let session = URLSession(configuration: .default)
    
    func performDataTask(with request: URLRequest, completionHandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        let myDataTask = session.dataTask(with: request){(data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { errorHandler(AppError.noData); return }
                if let error = error as? URLError {
                    switch error {
                    case URLError.notConnectedToInternet:
                        errorHandler(AppError.noInternet)
                        return
                    default:
                        errorHandler(AppError.urlError(rawError: error))
                    }
                }
                else {
                    if let error = error {
                        errorHandler(AppError.otherError(rawError: error))
                    }
                }
                completionHandler(data)
            }
        }
        myDataTask.resume()
    }
}
