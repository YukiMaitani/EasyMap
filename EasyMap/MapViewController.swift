//
//  MapViewController.swift
//  EasyMap
//
//  Created by 米谷裕輝 on 2021/12/07.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController:UIViewController{
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            print("ok")
            locationManager.startUpdatingLocation()
        }else{
            print("no")
        }
    }
}

extension MapViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let latitude = location?.coordinate.latitude
        let longtitude = location?.coordinate.longitude
        print("緯度:\(latitude!)経度:\(latitude!)")
    }
}
