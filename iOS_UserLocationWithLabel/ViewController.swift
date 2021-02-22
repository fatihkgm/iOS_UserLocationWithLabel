//
//  ViewController.swift
//  iOS_UserLocationWithLabel
//
//  Created by Fatih on 2021-02-21.
//

import UIKit
import CoreMotion
import CoreLocation
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var x: UILabel!
    @IBOutlet weak var y: UILabel!
    @IBOutlet weak var z: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    var motionManager: CMMotionManager!
    var locationManager: CLLocationManager!
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        motionManager = CMMotionManager()
        if motionManager.isAccelerometerAvailable{
            motionManager.accelerometerUpdateInterval = 1.0/60.0
            motionManager.startAccelerometerUpdates()
            
            timer = Timer(fire: Date(), interval: (1.0/60.0), repeats: true, block: {(timer) in
                if let data = self.motionManager.accelerometerData{
                    self.x.text = String(data.acceleration.x)
                    self.y.text = String(data.acceleration.x)
                    self.z.text = String(data.acceleration.x)
                }
            })
        }else{
            print("Acceleromoter is not avaliable")
        }
        
        
    }


}

