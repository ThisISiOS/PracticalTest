//
//  PTAppManager.swift
//  PracticalTest
//
//  Created by Hetal Patel on 05/11/20.
//  Copyright © 2020 Hetal Patel. All rights reserved.
//

import Foundation
import IQKeyboardManager
class PTAppManager : NSObject {
    enum AppStatusType : Int {
        case production
        case staging
        case local
    }
    
    static let shared = PTAppManager()
    var appStatus : AppStatusType = .local
    func setApp()
    {
        IQKeyboardManager.shared().isEnabled = true
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UINavigationBar.appearance().isTranslucent = false
    }
}
