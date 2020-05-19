//
//  StoreDetailViewController.swift
//  gmoney
//
//  Created by 장창순 on 13/05/2020.
//  Copyright © 2020 AnAppPerTwoWeeks.DiaryApp. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class StoreDetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var submittedDate: UILabel!
    private let locationManager = CLLocationManager()
    private let regionInMeters: Double = 500
    var store: Store!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        setup()
    }
    
    private func setup() {
        mapView.layer.cornerRadius = 25
        name.text = store.getName()
        type.text = store.getType()
        address.text = store.getAddress()
        phoneNumber.text = store.getPhoneNumber()
        submittedDate.text = store.getSubmittedDate()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func centerViewOnUserLocation() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: Double(store.getLatitude())!, longitude: Double(store.getLongitude())!)
        let region = MKCoordinateRegion.init(center: annotation.coordinate, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }
    }
    
    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            break
        case .denied:
            //위치정보활성화를 켜야하는 알람 구현
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        @unknown default:
            fatalError()
        }
    }

}

extension StoreDetailViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationServices()
    }
    
}
