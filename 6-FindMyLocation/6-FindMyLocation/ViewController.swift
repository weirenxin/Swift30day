//
//  ViewController.swift
//  6-FindMyLocation
//
//  Created by weirenxin on 2016/12/27.
//  Copyright © 2016年 广西家饰宝科技有限公司. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    
    private lazy var locationManager: CLLocationManager = {
        
        let locationManager = CLLocationManager()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        return locationManager
    }()
    
    private lazy var geoCoder: CLGeocoder = {
        return CLGeocoder()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func myLocationButtonDidTouch(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLabel.text = "Error while updating location " + error.localizedDescription
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let newLocation = locations.last else { return }
//        if newLocation.horizontalAccuracy < 0 { return }
        
        // 反地理编码
        geoCoder.reverseGeocodeLocation(newLocation) { (clps, error) in
            
            if error == nil {
                let pl = clps?.first
                let localityString = pl!.locality! + pl!.subLocality!
                self.locationLabel.text =  localityString + pl!.name!
            }
        }
        manager.stopUpdatingLocation()
    }
}


