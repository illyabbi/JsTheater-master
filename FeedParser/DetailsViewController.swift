//
//  DetailsViewController.swift
//  JsTheater
//
//  Created by John Park on 9/15/16.
//  Copyright © 2016 illyabbi. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController, UIWebViewDelegate {
    
    // Outlets & Controls
    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var myWebView: UIWebView!
    // refresh button
    @IBAction func refreshButtonClicked(sender: UIBarButtonItem) {
        self.refreshWebView()
    }
    
    // link to browse (this value set by parent controller)
    var link: String?
    
    // MARK: - view functions
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myWebView.delegate = self
        self.spinner.startAnimating()
        
        // load url in webview
        if let fetchURL = NSURL(string: self.link! ) {
            let urlRequest = NSURLRequest(url: fetchURL as URL)
            self.myWebView.loadRequest(urlRequest as URLRequest)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Webview delegate
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.spinner.stopAnimating()
    }
    private func webView(_ webView: UIWebView, didFailLoadWithError error: NSError?) {
        self.spinner.stopAnimating()
        self.showAlertMessage(alertTitle: "Error", alertMessage: "Error while loading url.")
    }
    
    // MARK: - Utility function
    // refresh webview
    func refreshWebView(){
        self.spinner.startAnimating()
        self.myWebView.reload()
    }
    // show alert with ok button
    private func showAlertMessage(alertTitle: String, alertMessage: String ) -> Void {
        // create alert controller
        let alertCtrl = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert) as UIAlertController
        // create action
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:
            { (action: UIAlertAction) -> Void in
                // you can add code here if needed
        })
        // add ok action
        alertCtrl.addAction(okAction)
        
        // present alert
        self.present(alertCtrl, animated: true, completion: { (void) -> Void in
            // you can add code here if needed
        })
    }
}
