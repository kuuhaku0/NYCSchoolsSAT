//
//  _0190211_TylerZhao_NYCSchools_SwiftTests.swift
//  20190211-TylerZhao-NYCSchools-SwiftTests
//
//  Created by Tyler Zhao on 2/11/19.
//  Copyright © 2019 Tyler Zhao. All rights reserved.
//

import XCTest
@testable import _0190211_TylerZhao_NYCSchools_Swift

class SchoolListViewControllerTest: XCTestCase {

    func test_bindViewModel() {
        // Given
        let mockData = BoroModel(initial: "M", name: "Manhattan")
        let vm = SchoolListViewModel(selectedBoro: mockData)
        let vc = SchoolListViewController(viewModel: vm)
        
        // When
        vc.bindViewModel()
        
        // Then
        XCTAssertEqual(vc.title, mockData.name)
        XCTAssertNotNil(vm.dataReceived)
        XCTAssertNotNil(vm.failedToGetData)
    }

}
