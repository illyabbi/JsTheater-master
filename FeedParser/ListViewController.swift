////
////  ListViewController.swift
////  JsTheater
////
////  Created by John Park on 9/22/16.
////  Copyright © 2016 illyabbi. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//
//
//class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, XMLParserDelegate {
//    
//    
//    // outlet - table view
//    @IBOutlet var myTableView: UITableView!
//    
//    // outet - activity indicator
//    @IBOutlet var spinner: UIActivityIndicatorView!
//    
//    
//    // xml parser
////    var myParser: NSXMLParser = NSXMLParser()
//    // entries and parser
//    var myParser: FeedParser?
//    var entries: [FeedItem]?
//    
//    
//    // rss records
//    var rssRecordList : [FeedItem] = [FeedItem]()
//    var rssRecord : FeedParser?
//    var isTagFound = [ "item": false , "title":false, "pubDate": false , "thumbnail": false , "link":false]
//    
//    
//    
//    
//    // MARK - View functions
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        // set tableview delegate
//        self.myTableView.dataSource = self
//        self.myTableView.delegate = self
//        // initialization
//        entries = []
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        myTableView.isHidden = true
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        
//        // load Rss data and parse
//        if self.rssRecordList.isEmpty {
//            self.loadRSSData()
//        }
//    }
//    
//    // MARK: - Table view dataSource and Delegate
//    
//    // return number of section within a table
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    // return row height
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 60
//    }
//    
//    // return how may records in a table
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.rssRecordList.count
//    }
//    
//    // return cell
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
//        
//        // collect reusable cell
//        let cell = tableView.dequeueReusableCellWithIdentifier("rssCell", forIndexPath: indexPath)
//        
//        // find record for current cell
//        let thisRecord : RssRecord  = self.rssRecordList[indexPath.row]
//        
//        // set value for main title and detail tect
//        cell.textLabel?.text = thisRecord.title
//        cell.detailTextLabel?.text = thisRecord.pubDate
//        // added value for thumbnail
//        //cell.imageView?.text = thisRecord.thumbnail
//        
//        // return cell
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("segueShowDetails", sender: self)
//    }
//    
//    
//    
//    
//    // MARK: - NSXML Parse delegate function
//    
//    // start parsing document
//    func parserDidStartDocument(parser: NSXMLParser) {
//        // start parsing
//    }
//    
//    // element start detected
//    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
//        
//        if elementName == "item" {
//            self.isTagFound["item"] = true
//            self.rssRecord = RssRecord()
//            
//        }else if elementName == "title" {
//            self.isTagFound["title"] = true
//            
//        }else if elementName == "link" {
//            self.isTagFound["link"] = true
//            
//        }else if elementName == "thumbnail" {
//            self.isTagFound["thumbnail"] = true
//            
//        }else if elementName == "pubDate" {
//            self.isTagFound["pubDate"] = true
//        }
//        
//    }
//    
//    // characters received for some element
//    
//    func parser(parser: NSXMLParser, foundCharacters string: String) {
//        
//        if isTagFound["title"] == true {
//            self.rssRecord?.title += string
//            
//        }else if isTagFound["link"] == true {
//            self.rssRecord?.link += string
//            
////        }else if isTagFound["thumbnail"] == true {
////            self.rssRecord?.thumbnail += string
//            
//        }else if isTagFound["pubDate"] == true {
//            self.rssRecord?.pubDate += string
//        }
//        
//    }
//    
//    // element end detected
//    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        
//        if elementName == "item" {
//            self.isTagFound["item"] = false
//            self.rssRecordList.append(self.rssRecord!)
//            
//        }else if elementName == "title" {
//            self.isTagFound["title"] = false
//            
//        }else if elementName == "link" {
//            self.isTagFound["link"] = false
//
////        }else if elementName == "thumbnail" {
////            self.isTagFound["thumbnail"] = false
//
//        }else if elementName == "pubDate" {
//            self.isTagFound["pubDate"] = false
//        }
//    }
//    
//    // end parsing document
//    func parserDidEndDocument(parser: NSXMLParser) {
//        
//        //reload table view
//        self.myTableView.reloadData()
//        
//        // stop spinner
//        self.spinner.stopAnimating()
//    }
//    
//    // if any error detected while parsing.
//    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
//        
//        //  stop animation
//        self.spinner.stopAnimating()
//        
//        // show error message
//        self.showAlertMessage(alertTitle: "Error", alertMessage: "Error while parsing xml.")
//    }
//    
//    
//    
//    
//    // MARK: - Utility functions
//    
//    // load rss and parse it
//    private func loadRSSData(){
//        
//        if let rssURL = NSURL(string: RSS_FEED_URL) {
//            
//            // start spinner
//            self.spinner.startAnimating()
//            
//            // fetch rss content from url
//            self.myParser = NSXMLParser(contentsOfURL: rssURL)!
//            
//            // set parser delegate
//            self.myParser.delegate = self
//            self.myParser.shouldResolveExternalEntities = false
//            
//            // start parsing
//            self.myParser.parse()
//        }
//        
//    }
//    
//    // show alert with ok button
//    private func showAlertMessage(alertTitle alertTitle: String, alertMessage: String ) -> Void {
//        
//        // create alert controller
//        let alertCtrl = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.Alert) as UIAlertController
//        
//        // create action
//        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:
//            { (action: UIAlertAction) -> Void in
//                // you can add code here if needed
//        })
//        
//        // add ok action
//        alertCtrl.addAction(okAction)
//        
//        // present alert
//        self.presentViewController(alertCtrl, animated: true, completion: { (void) -> Void in
//            // you can add code here if needed
//        })
//    }
//    
//    
//    
//    
//    // MARK: - Navigation
//    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
//        if segue.identifier == "segueShowDetails" {
//            
//            // find index path for selected row
//            let selectedIndexPath : [NSIndexPath] = self.myTableView.indexPathsForSelectedRows! as [NSIndexPath]
//            
//            // deselect the selected row
//            self.myTableView.deselectRow(at: selectedIndexPath[0] as IndexPath, animated: true)
//            
//            // create destination view controller
//            let destVc = segue.destination as! DetailsViewController
//            
//            // set title for next screen
//            destVc.navigationItem.title = self.rssRecordList[selectedIndexPath[0].row].title
//            
//            // set link value for destination view controller
//            destVc.link = self.rssRecordList[selectedIndexPath[0].row].link
//            
//        }
//        
//    }
//    
//    
//}
