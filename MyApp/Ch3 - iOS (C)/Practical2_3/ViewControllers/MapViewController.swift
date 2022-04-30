//
//  MapViewController.swift
//  MyApp
//
//  Created by Bansi Mamtora on 04/03/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var mapView: MKMapView!
    
    //MARK: - Variables
    var places = LocationModel.getLocationsWithCoordinates()
    var locationManager = CLLocationManager()
    var annotate = MKPointAnnotation()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialiser()
        checkLocationService()
        addCustomAnnotation()
    }
    
    //MARK: - Functions
    func initialiser() {
        pickerView.delegate = self
        pickerView.dataSource = self
        mapView.delegate = self
    }
    
    func centerLocation(_ location: LocationModel) {
        let place = CLLocation(latitude: location.placelattitude ?? .zero, longitude: location.placelongitude ?? .zero)
        let region = MKCoordinateRegion(center: place.coordinate, latitudinalMeters: Constants.centerMeters, longitudinalMeters: Constants.centerMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func checkLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            self.checkLocationAuthentication()
        }
    }
    
    func checkLocationAuthentication() {
        switch locationManager.authorizationStatus {
            case .authorizedAlways:
                break
            case .authorizedWhenInUse:
                mapView.showsUserLocation = true
                break
            case .denied:
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                mapView.showsUserLocation = true
                break
            default:
                break
        }
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
    }

    func cameraBoundary(_ location: LocationModel) {
        let place = CLLocation(latitude: location.placelattitude ?? .zero, longitude: location.placelongitude ?? .zero)
        let region = MKCoordinateRegion(center: place.coordinate, latitudinalMeters: Constants.cameraBoundaryMeters, longitudinalMeters: Constants.cameraBoundaryMeters)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated:true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: Constants.zoomRangeDistance)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    func addCustomAnnotation(){
        let custom = CustomAnnotation()
        custom.title = NSLocalizedString("Home", comment: "")
        custom.coordinate = CLLocationCoordinate2D(latitude: Constants.customLattitude, longitude: Constants.customLongitude)
        mapView.addAnnotation(custom)
    }
}

//MARK: - Picker Delegate
extension MapViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return places[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return Constants.pickerRowHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let place = places[row].title
        for location in places {
            if location.title == place {
                centerLocation(location)
                annotate.title = location.title
                annotate.coordinate = CLLocationCoordinate2D(latitude: location.placelattitude ?? .zero, longitude: location.placelongitude ?? .zero)
                mapView.addAnnotation(annotate)
                cameraBoundary(location)
            }
        }
    }
}

//MARK: - Picker DataSource
extension MapViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return places.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

}

//MARK: - Location Delegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            print(locations)
    }
}

//MARK: - Map Delegate
extension MapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is CustomAnnotation {
            var customView = mapView.dequeueReusableAnnotationView(withIdentifier: Constants.customAnnotation)
            if customView == nil {
                customView = MKAnnotationView(annotation: annotation, reuseIdentifier: Constants.customAnnotation)
                customView?.canShowCallout = true
            }
            else{
                customView?.annotation = annotation
            }
            guard let customAnnotation = annotation as? CustomAnnotation, let image = customAnnotation.imageName else {
                return nil
            }
            customView?.image = image
            return customView
        }
        else {
            return nil
        }
    }
}

//MARK: - Classes
class CustomAnnotation: MKPointAnnotation {
    var imageName = UIImage(named: Constants.checked)
}



