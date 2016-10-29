//
//  Twitter.swift
//  JsTheater
//
//  Created by John Park on 10/29/16.
//  Copyright © 2016 illyabbi. All rights reserved.
//

//import Foundation
//import UIKit
import TwitterKit


class TwitterController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        Twitter.sharedInstance().logIn { session, error in
//            if (session != nil) {
//                let alert = UIAlertController(title: "Logged In",
//                                              message: "signed in as \(session?.userName)")
//            } else {
//
//
            let logInButton = TWTRLogInButton { (session, error) in
                if let unwrappedSession = session {
                    let alert = UIAlertController(title: "Logged In",
                                                  message: "User \(unwrappedSession.userName) has logged in",
                        preferredStyle: UIAlertControllerStyle.alert
                    )
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    NSLog("Login error: %@", error!.localizedDescription);
                }
            }
            
            // TODO: Change where the log in button is positioned in your view
            logInButton.center = self.view.center
            self.view.addSubview(logInButton)
//            }
//        }
//
        
        //MARK: code to openURL
//        if let url = URL(string: "http://www.cacdigitalarts.com") {
//            UIApplication.shared.openURL(url)
//        }
    }
    
}

