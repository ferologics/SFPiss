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
    func showCurrentLocation()
    func reportPiss()
    func addLocationMarker()
    func updateLocation()
}

class MapViewController: UIViewController, MKMapViewDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func locate(sender: AnyObject) { showCurrentLocation() }
    @IBAction func iSmellPiss(sender: AnyObject) {}
    var regionRadius: CLLocationDistance { return 230 }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.showCurrentLocation()
    }
}
    
extension MapViewController:Location
{
    func showCurrentLocation()
    {
        PFGeoPoint.geoPointForCurrentLocationInBackground { (point, error) -> Void in
            if let geoPoint = point
            {
                self.centerMapOnLocation(CLLocation(latitude: geoPoint.latitude, longitude: geoPoint.longitude))
                print(geoPoint)
                
            } else { print(error) }
        }
    }
    
    func updateLocation() //TODO: update the users current location periodically based on movement
    {
        
    }
    
    func reportPiss() //TODO: add piss image at the current location
    {
        
    }
    
    func addLocationMarker() //TODO: add a visual representation of the current location of the user
    {
        
    }
    
    func centerMapOnLocation(location: CLLocation) // go back to the current location of the user
    {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance( location.coordinate,
                                                                   regionRadius * 2.0,
                                                                   regionRadius * 2.0 )
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
