//
//  HomeViewController.swift
//  ShopManage
//
//  Created by mac on 1/30/15.
//  Copyright (c) 2015 llzg. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let storedUsers: [String] = defaults.objectForKey("users") as? [String] {
            println(user)
        } else {
            let loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("loginVC") as LoginViewController
            self.presentViewController(loginVC, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
