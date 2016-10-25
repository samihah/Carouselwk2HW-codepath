//
//  IntroViewController.swift
//  CarouselDemo
//
//  Created by Samihah Azim on 10/21/16.
//  Copyright © 2016 Samihah Azim. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var introImageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        scrollView.contentSize = introImageView.frame.size
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
