//
//  PresenterTests.swift
//  MVPDemo
//
//  Created by popota on 2017/04/08.
//  Copyright © 2017年 popota. All rights reserved.
//

import XCTest
import Nimble
import Quick

@testable import MVPDemo

class PresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let toursView: ToursView = ViewController() as! ToursView
        let presenter = TourPresenterImpl(view: toursView)
        presenter.showTours()
    }
    
    
}
