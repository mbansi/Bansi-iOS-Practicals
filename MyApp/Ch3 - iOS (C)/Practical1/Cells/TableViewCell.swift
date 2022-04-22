//
//  TableViewCell.swift
//  MyApp
//
//  Created by Bansi Mamtora on 03/03/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgCricketer: UIImageView!
    
    //MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Functions
    func configCell(data: CricketerModel){
        lblName.text = data.cricketerName
        imgCricketer.image = UIImage(named: data.cricketerImage )
    }
    
}
