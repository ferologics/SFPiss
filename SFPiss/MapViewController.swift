//
//  ViewController.swift
//  SFPiss
//
//  Created by mbp_13 on 27/09/15.
//  Copyright © 2015 ferologics. All rights reserved.
//

import UIKit
import MapKit
import Parse

protocol Location
{
    var regionRadius: CLLocationDistance { get }
    func centerMapOnLocation(location: CLLocation)
}

class MapViewController: UIViewController, MKMapViewDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    
    var regionRadius: CLLocationDistance { return 1000 }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        PFGeoPoint.geoPointForCurrentLocationInBackground { (point, error) -> Void in
            if let geoPoint = point
            {
                self.centerMapOnLocation(CLLocation(latitude: geoPoint.latitude, longitude: geoPoint.longitude))
                print(geoPoint)
                
            } else { print(error) }
        }
    }
}
    
extension MapViewController:Location
{
    func centerMapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
