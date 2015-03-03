//
//  LoginViewController.swift
//  ShopManage
//
//  Created by mac on 1/30/15.
//  Copyright (c) 2015 llzg. All rights reserved.

//  mpc.issll.com/llzgmri/m/p/user/login?accountName=%@&pwd=%@
//  http://llzg.com/llzgmri/m/p/

import UIKit
import Foundation

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userNameField.text = "llzgllzgllzg"
        passwordField.text = "123456"
        
    }
    
    override func viewDidAppear(animated: Bool) {
        userNameField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPressed(sender: UIButton) {
        let httpMethod = "POST"
        let timeout = 15
        var urlAsString = "http://mpc.issll.com/llzgmri/m/p/user/login"
        var param = NSString(format: "?accountName=%@&pwd=%@", userNameField.text, passwordField.text)
        urlAsString += param
        //println(urlAsString)
        let url = NSURL(string: urlAsString)
        
        let urlRequest = NSMutableURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 15.0)
        urlRequest.HTTPMethod = httpMethod
        
        let body = param.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        urlRequest.HTTPBody = body
        
        let queue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: queue, completionHandler: {
            (response: NSURLResponse!, data: NSData!, error: NSError!) in
            if data.length > 0 && error == nil {
                //let html = NSString(data: data, encoding: NSUTF8StringEncoding)
                let jsonObj: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
                if let jsonDic = jsonObj as? NSDictionary {
                    println(jsonDic)
                    
                    if let isSuccess = jsonDic.valueForKey("isSuccess") as? String {
                        println("-----login success: \(isSuccess)")
                        if let userObj = jsonDic.valueForKey("user") as? NSDictionary {
                            if let tag = userObj.valueForKey("tag") as? String {
                                println("tag = \(tag)")
                            }
                            if let userID = userObj.valueForKey("userid") as? Int {
                                println("user ID = \(userID)")
                            }
                            if let userName = userObj.valueForKey("name") as? String {
                                println("Phone Number = \(userName)")
                            }
                            if let phoneNumber = userObj.valueForKey("phoneNum") as? String {
                                println("Phone Number = \(phoneNumber)")
                            }
                        }
                    }
                }
                
                /*
                let user: Dictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil) as NSDictionary
                let keys = user.count
                println("------key:\(keys)")
                
                var jsonError: NSError?
                
                if NSJSONSerialization.isValidJSONObject(jsonObj!) {
                    let jsonData = NSJSONSerialization.dataWithJSONObject(jsonObj, options: NSJSONWritingOptions.PrettyPrinted, error: &jsonError)
                    
                    if let jdata = jsonData {
                        if jdata.length > 0 && jsonError == nil {
                            println("Success")
                            
                            let jsonString = NSString(data: jdata, encoding: NSUTF8StringEncoding)
                            println("JSON String = \(jsonString)")
                        } else if data.length == 0 && jsonError == nil {
                            println("no data returned after serialization")
                        } else if jsonError != nil {
                            println("error happened = \(jsonError)")
                        }
                    }
                }else {
                    println("not valid JSON Object")
                }
                */
                
                
            } else if data.length == 0 && error == nil {
                println("nothing was downloaded")
            } else if error != nil {
                println("Error happened = \(error)")
            }
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func texFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func backgroundTap(sender: UIControl) {
        userNameField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }

}
