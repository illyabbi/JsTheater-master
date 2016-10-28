//
//  About.swift
//  JsTheater
//
//  Created by John Park on 10/23/16.
//  Copyright © 2016 Ignacio Nieto Carvajal. All rights reserved.
//


import UIKit
import TwitterKit


class aboutController: UIViewController {



        override func viewDidLoad() {
            super.viewDidLoad()

            //MARK: TWITTER LOGIN
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

            //MARK: code to openURL
            if let url = URL(string: "http://www.cacdigitalarts.com") {
                UIApplication.shared.openURL(url)
            }
        }

}
