//
//  ViewController.swift
//  swiftTest
//
//  Created by Sunghoon.OH on 2016. 12. 22..
//  Copyright © 2016년 Sunghoon.OH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var swiftLabel: UILabel!
    
    @IBAction func pushBTText(sender: AnyObject) {
        if (swiftLabel.text == "swiftTest") {
            //swiftLabel.text = "change"
            
            // db data print to label(request web server)
            simpleInfoDBData(swiftLabel)
            //swiftLabel.text = sidata.description
        }
        else {
            swiftLabel.text = "swiftTest"
        }
    }

}

func simpleInfoDBData(sLabel: UILabel) {
    
    /*
    // GET
    let mainUrl = "http://127.0.0.1:8000/"
    let subUrl = "si_list/"
    let url = NSURL(string: mainUrl + subUrl)!
    let session = NSURLSession.sharedSession()
    
    let task = session.dataTaskWithURL(url, completionHandler: {
        (data, response, error) -> Void in
        
        dispatch_async(dispatch_get_main_queue()) {
            if data != nil {
                let result = NSString(data: data!, encoding: NSUTF8StringEncoding)!
                sLabel.text = result as String
            }
            else {
                sLabel.text = "no request"
            }
        }
    })
    
    task.resume()
    */
    
    // POST
    let mainUrl = "http://127.0.0.1:8000/"
    let subUrl = "si_list/"
    let url = NSURL(string: mainUrl + subUrl)
    let request = NSMutableURLRequest(URL: url!)
    request.HTTPMethod = "POST"
    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession(configuration: config)
    
    let task = session.dataTaskWithRequest(request) { data, response, error in
        
        dispatch_async(dispatch_get_main_queue()) {
            if data != nil {
                let result = NSString(data: data!, encoding: NSUTF8StringEncoding)!
                sLabel.text = result as String
            }
            else {
                sLabel.text = "no request"
            }
        }
    }
    
    task.resume()
}

