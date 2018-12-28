//
//  ViewController.swift
//  GesturesProject
//
//  Created by madhu on 12/28/18.
//  Copyright © 2018 madhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var swipeUPGesture:UISwipeGestureRecognizer!
    var swipeDownGesture:UISwipeGestureRecognizer!
    var swipeLeftGesture:UISwipeGestureRecognizer!
    var swipeRightGesture:UISwipeGestureRecognizer!
    var rotationGesture:UIRotationGestureRecognizer!
    var pinchGesture:UIPinchGestureRecognizer!
    var panGesture:UIPanGestureRecognizer!
    @IBOutlet weak var UIview: UIView!
    
    
    
    
    override func viewDidLoad() {
        createUI()
        
        
        if let plisthPath = Bundle.main.path(forResource: "india", ofType: "plist"){
        
        if let dict = NSDictionary(contentsOf: URL(fileURLWithPath: plisthPath)){
        print(dict)
        }
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func createUI()
    {
        swipeUPGesture = UISwipeGestureRecognizer(target: self, action: #selector(onTapUp))
        swipeUPGesture.direction = .up
        UIview.addGestureRecognizer(swipeUPGesture)
        swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(onTapDown))
        swipeDownGesture.direction = .down
        UIview.addGestureRecognizer(swipeDownGesture)
        
        swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(onTapLeft))
        swipeLeftGesture.direction = .left
        UIview.addGestureRecognizer(swipeLeftGesture)
        
        swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(onTapRight))
        swipeRightGesture.direction = .right
        UIview.addGestureRecognizer(swipeRightGesture)
        
        rotationGesture = UIRotationGestureRecognizer(target: self, action:#selector(onTapRotation))
        UIview.addGestureRecognizer(rotationGesture)
        
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(onTapPinch))
        UIview.addGestureRecognizer(pinchGesture)
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(onTapPan(sender:)))
        UIview.addGestureRecognizer(panGesture)
        
    }
    

    @objc func onTapUp()
    {
        label.text = "tapped upside"
    }
    
    @objc func onTapDown()
    {
        label.text = "tapped Downside"
    }
    @objc func onTapLeft()
    {
        label.text = "tapped Leftside"
    }
    
    @objc func onTapRight()
    {
        label.text = "tapped Rightside"
    }
    
    @objc func onTapRotation()
    {
        label.text = "tapped rotation"
        
        UIview.transform = UIview.transform.rotated(by: rotationGesture.rotation)
        print(rotationGesture.rotation)
        rotationGesture.rotation = 0
        
    }
    
    
    @objc func onTapPinch()
    {
        label.text = "tapped Pinch"
        
        UIview.transform = UIview.transform.scaledBy(x: pinchGesture.scale, y: pinchGesture.scale)
        pinchGesture.scale = 1
        print(pinchGesture.velocity)
    }
    
    @objc func onTapPan(sender:UIPanGestureRecognizer)
    {
        label.text = "tapped pan"
        let translation = sender.translation(in: UIview)
       UIview.center = CGPoint(x:UIview.center.x + translation.x,
                                      y:UIview.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

