//
//  ToursTableViewCell.swift
//  MVPDemo
//
//  Created by popota on 2017/04/08.
//  Copyright © 2017年 popota. All rights reserved.
//

import UIKit

class ToursTableViewCell: UITableViewCell {
    
    @IBOutlet weak var _imageView: UIImageView!
    @IBOutlet weak var _depLabel: UILabel!
    @IBOutlet weak var _desLabel: UILabel!
    @IBOutlet weak var _tourTitle: UILabel!
    @IBOutlet weak var _price: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(withTourData tourData: Tours) {
        let url = URL(string: tourData.imageURL)!
        let data = try? Data(contentsOf: url)
        guard let image = UIImage(data: data!) else {
            return
        }
        _imageView.image = image
//        _imageView.contentMode = .scaleAspectFit
        _depLabel.text = tourData.deptCountry
        _desLabel.text = tourData.destCountry
        _tourTitle.text = tourData.title
        _price.text = tourData.price.description + "円"
    }
    
}
