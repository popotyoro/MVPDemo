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
import PromiseKit

@testable import MVPDemo

class PresenterTests: QuickSpec {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    override func spec() {
        
        let vc = ViewController()
        vc.presenter = TourPresenterImpl(view: vc)
        
        describe("Presenterのテスト") {
            context("requestTours実行前") {
                it("Toursリストが空であること") {
                    expect(vc.presenter.numberOfTours == 0).to(beTruthy())
                }
            }
            
            context("requestTours実行後") {
                it("Toursリストの個数が10であること") {
                    waitUntil(timeout: 10, action: { (done) in
                        vc.presenter.requestTours(completionHandler: { 
                            expect(10).to(equal(vc.presenter.numberOfTours))
                        })
                        done()
                    })
                }
                
            }
        }
    }
    
}
