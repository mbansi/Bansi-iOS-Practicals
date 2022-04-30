//
//  LocationModel.swift
//  MyApp
//
//  Created by Bansi Mamtora on 04/03/22.
//

import UIKit
import MapKit

class LocationModel: NSObject{
    
    //MARK: - Variables
    var title: String
    var placelattitude: Double?
    var placelongitude: Double?
    
    //MARK: - Functions
    init(_ name: String){
        title = name
    }
    
    init(_ name: String,_ lattitude: Double,_ longitude: Double){
        title = name
        placelattitude = lattitude
        placelongitude = longitude
    }
    
    static func getLocationsWithCoordinates() -> [LocationModel] {
        return [ LocationModel(NSLocalizedString("New Delhi", comment: ""), Constants.newDelhiLattitude, Constants.newDelhiLongitude),
                 LocationModel(NSLocalizedString("Ahmedabad", comment: ""), Constants.ahmedabadLattitude, Constants.ahmedabadLongitude),
                 LocationModel(NSLocalizedString("Goa", comment: ""), Constants.goaLattitude, Constants.goaLongitude),
                 LocationModel(NSLocalizedString("Kerala", comment: ""), Constants.keralaLattitude, Constants.keralaLongitude),
                 LocationModel(NSLocalizedString("Shimla", comment: ""), Constants.shimlaLattitude, Constants.shimlaLongitude)]
    }
}
