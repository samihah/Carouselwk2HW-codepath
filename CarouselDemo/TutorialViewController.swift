//
//  TutorialViewController.swift
//  CarouselDemo
//
//  Created by Samihah Azim on 10/24/16.
//  Copyright © 2016 Samihah Azim. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backupButton: UIImageView!
    
    var screenToShow : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 1500, height: 667)
        scrollView.delegate = self
        backupButton.alpha = 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        screenToShow = Int(round(scrollView.contentOffset.x / 375))
        pageControl.currentPage = screenToShow
        if (screenToShow == 3) {
            pageControl.isHidden = true
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.backupButton.alpha = 1
            })
        } else {
            pageControl.isHidden = false
            if (backupButton.alpha > 0) {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    self.backupButton.alpha = 0
                })
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
