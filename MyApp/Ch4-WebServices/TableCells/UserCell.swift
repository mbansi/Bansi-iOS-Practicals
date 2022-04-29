//
//  UserCell.swift
//  MyApp
//
//  Created by Bansi Mamtora on 28/03/22.
//

import UIKit

class UserCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Functions
    func configCell(data: Users){
        guard let url = URL(string: data.avatar) else {
            return
        }
        let image = try? UIImage(data: Data(contentsOf: url))
        imgUser.image = image
        lblName.text = data.firstName + " " + data.lastName
        lblEmail.text = data.email
    }
}
