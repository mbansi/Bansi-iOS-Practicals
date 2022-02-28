//
//  CricketerModel.swift
//  MyApp
//
//  Created by Bansi Mamtora on 03/03/22.
//

import UIKit

class CricketerModel: NSObject {
    
    //MARK: - Variables
    var cricketerName: String
    var cricketerImage: String
    
    //MARK: - Functions
    init(_ name: String,_ image: String){
        cricketerName = name
        cricketerImage = image
    }
    
    static func getCricketers() -> [CricketerModel] {
        return [ CricketerModel("Virat Kohli", "virat"),
                 CricketerModel("MS Dhoni", "dhoni"),
                 CricketerModel("Rohit Sharma", "rohit"),
                 CricketerModel("Hardik Pandya", "hardik"),
                 CricketerModel("Jasprit Bumrah", "jasprit")]
    }
    
}
