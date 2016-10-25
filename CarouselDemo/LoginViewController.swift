//
//  LoginViewController.swift
//  CarouselDemo
//
//  Created by Samihah Azim on 10/23/16.
//  Copyright © 2016 Samihah Azim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var fieldParentView: UIView!
    @IBOutlet var buttonParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //variables for initial Y and offset defined here
    //var initialY: CGFloat!
    //var offset: CGFloat!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        buttonInitialY = fieldParentView.frame.origin.y
        buttonOffset = -100
        
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.UIkeyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LoginViewController.UIkeyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -150
        

        // Set the scroll view content size
        scrollView.contentSize = scrollView.frame.size
        // Set the content insets
        //scrollView.contentInset.bottom = 100
        
        

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y < scrollView.contentInset.bottom) {
            view.endEditing(true)
        }
        // This method is called as the user scrolls

    }
    
    func UIkeyboardWillShow(_ notification: Notification!) {
        print("keyboardWillShow")
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    
    func UIkeyboardWillHide(_ notification: Notification!) {
        print("keyboardWillHide")
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    
    @IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    //this is to get rid of the keyboard when tapping outside of text fields
    
    
    @IBAction func didPressLogin(_ sender: AnyObject) {
        if (emailField.text == "" || passwordField.text == "") {
            // These are empty fields
            let emptyAlertContoller = UIAlertController(
                title: "Missing fields",
                message: "Enter email address and password.",
                preferredStyle: .alert
            )
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
            }
            emptyAlertContoller.addAction(OKAction)
            
            present(emptyAlertContoller, animated: true) {
                self.spinner.startAnimating()
                // something here?
            }
        } else if emailField.text == "testuser@user.com" && passwordField.text == "password" {
            spinner.startAnimating()
            //Success!
            delay(2, closure: {
                self.loginButton.isSelected = false
                self.spinner.stopAnimating()
                self.performSegue(withIdentifier: "LoginToTutorialSegue", sender: self)
            })
        } else {
                // Wrong email or password
                delay(2, closure: {
                    self.loginButton.isSelected = false
                    self.spinner.stopAnimating()
                    let incorrectAlertContoller = UIAlertController(
                        title: "Wrong",
                        message: "I know it, you know it, we all know it.",
                        preferredStyle: .alert
                    )
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        //Failure
                    }
                    incorrectAlertContoller.addAction(OKAction)
                    
                    self.present(incorrectAlertContoller, animated: true) {
                    }
            })
            }
        }
        
    }
