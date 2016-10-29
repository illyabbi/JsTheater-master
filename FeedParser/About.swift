//
//  About.swift
//  JsTheater
//
//  Created by John Park on 10/23/16.
//  Copyright © 2016 illyabbi. All rights reserved.
//


import UIKit


class aboutController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //MARK: code to openURL
        if let url = URL(string: "http://www.cacdigitalarts.com") {
            UIApplication.shared.openURL(url)
        }
    }

}
