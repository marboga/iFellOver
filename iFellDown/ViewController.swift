//
//  ViewController.swift
//  iFellDown
//
//  Created by Michael Arbogast on 5/6/16.
//  Copyright © 2016 Michael Arbogast. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet var accX: UILabel!
    @IBOutlet var accY: UILabel!
    @IBOutlet var accZ: UILabel!
    
    @IBOutlet var rotX: UILabel!
    @IBOutlet var rotY: UILabel!
    @IBOutlet var rotZ: UILabel!
    
    @IBOutlet var maxAccX: UILabel!
    @IBOutlet var maxAccY: UILabel!
    @IBOutlet var maxAccZ: UILabel!
    
    @IBOutlet var maxRotX: UILabel!
    @IBOutlet var maxRotY: UILabel!
    @IBOutlet var maxRotZ: UILabel!
    
    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0
    
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0
    
    lazy var motionManager = CMMotionManager()
    
    
    @IBAction func resetMaxValues(sender: UIButton) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if (motionManager.gyroAvailable && motionManager.accelerometerAvailable && motionManager.deviceMotionAvailable) {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.accelerometerUpdateInterval = 0.1
            if !motionManager.deviceMotionActive {
                let queue = NSOperationQueue()
                motionManager.startDeviceMotionUpdatesToQueue(queue, withHandler: {
                    data, error in
                    print("acceleration x y z", data?.userAcceleration.x, data?.userAcceleration.y, data?.userAcceleration.z )
                    print("gravity", data?.gravity)
                    print("attitude", data?.attitude)
                    print("rotationRate", data?.rotationRate)
                    self.currentMaxAccelX = (data?.userAcceleration.x)!
                    
                })
            }
            
        }
        
    }

    func updateUI() {
        self.accX.text = "\(self.currentMaxAccelX)"
        self.accY.text = "\(self.currentMaxAccelY)"
        self.accZ.text = "\(self.currentMaxAccelZ)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

