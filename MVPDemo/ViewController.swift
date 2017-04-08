//
//  ViewController.swift
//  MVPDemo
//
//  Created by popota on 2017/04/08.
//  Copyright © 2017年 popota. All rights reserved.
//

import UIKit

protocol ToursView: class {
    func reloadData()
}

class ViewController: UIViewController, UITableViewDelegate, ToursView {

    @IBOutlet weak var _tableView: UITableView!
    
    var presenter: TourPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        _tableView.dataSource = self
        
        let nib = UINib(nibName: "ToursTableViewCell", bundle: nil)
        _tableView.register(nib, forCellReuseIdentifier: "Cell")
        
        let toursView = self
        presenter = TourPresenterImpl(view: toursView)
        presenter.showTours()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reloadData() {
        _tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ToursTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ToursTableViewCell
        
        let tourData = presenter.tourData(index: indexPath.row)
        
        cell.setData(withTourData: tourData)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfTours
    }
}

