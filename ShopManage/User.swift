//
//  User.swift
//  ShopManage
//
//  Created by mac on 2/27/15.
//  Copyright (c) 2015 llzg. All rights reserved.
//

import Foundation
import UIKit

class User {
    class var sharedUser : User {
        struct Singleton {
            static let instance = User()
        }
        return Singleton.instance;
    }
    private(set) var users: [String]
    
    init() {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let storedUser = defaults.objectForKey("user") as? [String]
        users = storedUser != nil ? storedUser! : []
    }
    
    func addUser(userName: String) {
        users[0] = userName
        saveUsers()
    }
    
    func removeUser(userName: String) {
        if let index = find(users, userName) {
            users.removeAtIndex(index)
            saveUsers()
        }
    }
    
    func saveUsers() {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(users, forKey: "users")
        defaults.synchronize()
    }
}