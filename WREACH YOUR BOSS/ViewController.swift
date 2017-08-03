//
//  ViewController.swift
//  WREACH YOUR BOSS
//
//  Created by 谷家辰 on 2017/7/31.
//  Copyright © 2017年 Make School. All rights reserved.
//

import UIKit

class ViewController : UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var RightPressTime = 0
    var LeftPtessTime = 0
   // var TotleTime = 0
    
    @IBOutlet weak var LeftPunchTimes: UITextField!
    
    @IBOutlet weak var PunchTimes: UITextField!
    
 
    @IBOutlet weak var chooseImageButton: UIButton!
    
    @IBOutlet weak var BlueFist: UIImageView!
 
    @IBOutlet weak var RedFist: UIImageView!
    
    @IBAction func LeftFistButton(_ sender: Any) {
        LeftPtessTime += 1
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -100,y: 300))
        path.addCurve(to: CGPoint(x: 100, y: 100), controlPoint1: CGPoint(x: 200, y: 59), controlPoint2: CGPoint(x: 200, y: 90))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.cgPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        
        
        anim.duration = 0.5
        
        // we add the animation to the squares 'layer' property
        RedFist.layer.add(anim, forKey: "animate position along path")
        LeftPunchTimes.text = String(LeftPtessTime)
    }
    
    
    @IBAction func RightFistButton(_ sender: Any) {
        
        RightPressTime += 1
        
        
    
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 400,y: 300))
        path.addCurve(to: CGPoint(x: 200, y: 200), controlPoint1: CGPoint(x: 300, y: 250), controlPoint2: CGPoint(x: 50, y: 90))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.cgPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
       
        
        anim.duration = 0.4
        
        // we add the animation to the squares 'layer' property
       BlueFist.layer.add(anim, forKey: "animate position along path")
        
        PunchTimes.text = String(RightPressTime)
    }
    
    
    
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "BACK" {
                print("BACK button tapped")
            }
        }
    }
    
    @IBAction func unwindtofirstViewController(_ segue: UIStoryboardSegue) {
        
        // for now, simply defining the method is sufficient.
        // we'll add code later
        
    }
    
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    let imagePicker = UIImagePickerController()
    
    
    @IBAction func ChooseButtonTapped(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes =    UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
      
       
    
        imagePicker.delegate = self
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Delegates
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
        
    {let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        
        imageView.contentMode = .scaleToFill//3
        
        
        imageView.image = chosenImage //4
        
        
        dismiss(animated:true, completion: nil) //5
        chooseImageButton.titleLabel?.text = ""
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        
        
    }
    
    // animation code from her
}

