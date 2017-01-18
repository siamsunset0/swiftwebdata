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
            swiftLabel.text = "change"
            
            // db data print to label(request web server)
            let sidata = simpleInfoDBData()
            swiftLabel.text = sidata.description
        }
        else {
            swiftLabel.text = "swiftTest"
        }
    }

}

func simpleInfoDBData() -> NSString {
    
    let mainUrl = "http://127.0.0.1:8000/"
    let subUrl = "si_list/"
    let urlString = mainUrl + subUrl
    //let params = ""
    var result: NSString? = nil
    
    let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession(configuration: sessionConfig)
    let url = NSURL(string: urlString)!
    let request = NSMutableURLRequest(URL: url)
    request.HTTPMethod = "POST"
    /*
    do
    {
        request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: NSJSONWritingOptions.PrettyPrinted)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    }
    catch
    {
        return ("Error")
    }
    */
    NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
        
        if data != nil {
            result = NSString(data: data!, encoding: NSASCIIStringEncoding)!
        }
        else {
            result = "request error"
        }
        
        /*
        if error != nil {
            result = "request error"
        } else {
            result = NSString(data: data!, encoding: NSASCIIStringEncoding)!
        }*/
    }.resume()
    
    if result == nil {
        result = "NULL"
    }
    
    return result!
}
