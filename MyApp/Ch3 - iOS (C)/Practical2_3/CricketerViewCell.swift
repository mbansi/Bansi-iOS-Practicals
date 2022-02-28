//
//  CricketerViewCellTableViewCell.swift
//  MyApp
//
//  Created by Bansi Mamtora on 07/03/22.
//

import UIKit

class CricketerViewCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgCricketer: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK: - Functions
    func configCell(data: CricketerModel){
        lblName.text = data.cricketerName
       imgCricketer.image = UIImage(named: data.cricketerImage ?? "")
    }
}
