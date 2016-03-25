//
//  BigViewController.swift
//  SlideshowApp
//
//  Created by 渡邊翼 on 2016/03/25.
//  Copyright © 2016年 渡邊翼. All rights reserved.
//

import UIKit

class BigViewController: UIViewController {
    var Bigindex:Int = 0

    @IBOutlet weak var BigImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BigImageView.image = UIImage(named:"picture" + String(Bigindex) + ".png")
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        // segueから遷移先のResultViewControllerを取得する
        if(segue.identifier == "back"){
            let viewController:ViewController = segue.destinationViewController as! ViewController
            
            viewController.index = Bigindex
            
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
