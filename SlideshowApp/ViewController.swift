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
    var state:Int!
    var timer : NSTimer!
    

    
    @IBOutlet weak var MyImageView: UIImageView!
    
    @IBOutlet weak var StartStopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var imageListArray:[UIImage] = []
    

    

    
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

        if(state == 0) {
        StartStopButton.setTitle("停止", forState: UIControlState.Normal)
                    timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.imageChange), userInfo: nil, repeats: true)
         }
        
        
        else {
            
            timer.invalidate()
            StartStopButton.setTitle("再生", forState: UIControlState.Normal)
            state = 0
            nextButton.enabled = true
            backButton.enabled = true
            
            }
    }
    func imageChange(){
        if(index == nil)
        {
            index = 0
        }
        
        index = index + 1
        
        if(index == 4){
            index = 1
        }

        MyImageView.image = UIImage(named:"picture" + String(index) + ".png")
       state = 1

    }
    
        
    
    func didClickImageView(recognizer: UITapGestureRecognizer){
        print("tap!!!")
        if(index == nil){
            print("no image")
        }
        else if(MyImageView.isAnimating()) {
            performSegueWithIdentifier("toBig", sender: nil)
        }
        else {
        performSegueWithIdentifier("toBig", sender: nil)
        }
        

   
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
        state = 0
        for index in 1...3{
            let BuilderImage = UIImage(named:"picture" + String(index) + ".png")
            if(BuilderImage != nil){
                imageListArray.append(BuilderImage!)
            }
        }
        StartStopButton.setTitle("再生", forState: UIControlState.Normal)
        MyImageView.image = UIImage(named:"picture" + String(index) + ".png")
        MyImageView.userInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.didClickImageView(_:)))
        MyImageView.addGestureRecognizer(gesture)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

