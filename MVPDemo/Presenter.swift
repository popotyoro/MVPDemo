//
//  Presenter.swift
//  MVPDemo
//
//  Created by popota on 2017/04/08.
//  Copyright © 2017年 popota. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol TourPresenter: class {
    init(view: ToursView)
    var numberOfTours: Int {get}
    func tourData(index: Int) -> Tours
    func requestTours(completionHandler: (() -> ())?)
}

struct URLParam {
    static let apiKey = "XXXXXXXXXXXXXXXX"
    static let format = "json"
    static let area = "EUR"
    static let dep = "TYO"
    static let count = 10
    
    static var parameters: Parameters {
        get {
            return ["key" : URLParam.apiKey,
                "format" : URLParam.format,
                "area" : URLParam.area,
                "dept" : URLParam.dep,
                "count" : URLParam.count]
        }
    }
}

final class TourPresenterImpl: TourPresenter {
    
    private let view: ToursView
    private var tours: [Tours] = []
    
    required init(view: ToursView) {
        self.view = view
    }
    
    var numberOfTours: Int {
        return tours.count
    }
    
    func tourData(index: Int) -> Tours {
        return tours[index]
    }
    
    func requestTours(completionHandler: (() -> ())?) {
    
        Alamofire.request("http://webservice.recruit.co.jp/ab-road/tour/v1/?", parameters: URLParam.parameters).responseJSON { (response) in
            guard let jsonData = response.result.value else {
                return
            }
            let json = JSON(jsonData)
            
            json["results"]["tour"].forEach({ (head, data) in
                let tour = Tours(title: data["title"].string!,
                      deptCountry: data["dept_city"]["name"].string!,
                      destCountry: data["dest"]["name"].string!,
                      price: data["price"]["all_month"]["max"].int!,
                      imageURL: data["img"][0]["s"].string!)
                
                self.tours.append(tour)
            })
            
            completionHandler?()
        }
    }
}
