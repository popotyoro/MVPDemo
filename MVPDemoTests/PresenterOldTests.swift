//
//  PresenterOldTests.swift
//  MVPDemo
//
//  Created by popota on 2017/04/08.
//  Copyright © 2017年 popota. All rights reserved.
//

import XCTest
@testable import MVPDemo

class PresenterOldTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPresenter_requestTours実行前はToursのcountが0() {
        let vc = ViewController()
        vc.presenter = TourPresenterImpl(view: vc)
        let actual = vc.presenter.numberOfTours
        
        XCTAssertEqual(0, actual)
    }
    
    
    func testPresenter_registHogehogehoge () {
        
    }
    
    
}
