//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 渡邊翼 on 2016/03/25.
//  Copyright © 2016年 渡邊翼. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var index:Int!

    
    @IBOutlet weak var MyImageView: UIImageView!
    
    @IBOutlet weak var StartStopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    

    
    @IBAction func next(sender: AnyObject) {
        if(index == nil)
        {
            index = 0
        }
        index = index + 1
        
        if(index == 4){
            index = 1
        }
        MyImageView.image = UIImage(named:"picture" + String(index) + ".png")
        
    }
    
    @IBAction func back(sender: AnyObject) {
        if(index == nil)
        {
            index = 4
            
        }
        index = index - 1
        if(index == 0){
            index = 3
        }
        MyImageView.image = UIImage(named:"picture" + String(index) + ".png")

    }

    @IBAction func StartStop(sender: AnyObject) {
        nextButton.enabled = false
        backButton.enabled = false
        if(!MyImageView.isAnimating()){
            StartStopButton.setTitle("停止", forState: UIControlState.Normal)
            var imageListArray:[UIImage] = []
            for index in 1...3{
                let BuilderImage = UIImage(named:"picture" + String(index) + ".png")
                if(BuilderImage != nil){
                    imageListArray.append(BuilderImage!)
                }
            }
            MyImageView.animationImages = imageListArray
            
            MyImageView.animationDuration = 2.0
            MyImageView.animationRepeatCount = 0
            MyImageView.startAnimating()

        }
        else if(MyImageView.isAnimating()) {
            MyImageView.stopAnimating()
            StartStopButton.setTitle("再生", forState: UIControlState.Normal)
            nextButton.enabled = true
            backButton.enabled = true

            
        }
    }
    
    func didClickImageView(recognizer: UITapGestureRecognizer){
        print("tap!!!")
        performSegueWithIdentifier("toBig", sender: nil)

   
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        // segueから遷移先のResultViewControllerを取得する
        if(segue.identifier == "toBig"){
        let bigViewController:BigViewController = segue.destinationViewController as! BigViewController
            
            bigViewController.Bigindex = index
            
        }
       

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        StartStopButton.setTitle("再生", forState: UIControlState.Normal)
        MyImageView.image = UIImage(named:"picture" + String(index) + ".png")
        MyImageView.userInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: "didClickImageView:")
        MyImageView.addGestureRecognizer(gesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

