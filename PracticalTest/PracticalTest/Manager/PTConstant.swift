//
//  PTConstant.swift
//  PracticalTest
//
//  Created by Hetal Patel on 05/11/20.
//  Copyright © 2020 Hetal Patel. All rights reserved.
//

import Foundation
import UIKit

var baseURL : String {
    switch PTAppManager.shared.appStatus {
    case .production:
        return "https://newsapi.org/v2/"
    case .staging:
        return "https://newsapi.org/v2/"
    case .local:
        return "https://newsapi.org/v2/"
    }
}
struct Storyboard {
    static let main = "Main"
}
struct Controller {
    static var web : PTLinkController {
        (UIStoryboard(name: Storyboard.main, bundle: nil).instantiateViewController(withIdentifier: "PTLinkController") as? PTLinkController)!
    }
    static var newsDetail : PTDetailsController {
        (UIStoryboard(name: Storyboard.main, bundle: nil).instantiateViewController(withIdentifier: "PTDetailsController") as? PTDetailsController)!
    }
    static var newsImageDetail : PTImageController {
           (UIStoryboard(name: Storyboard.main, bundle: nil).instantiateViewController(withIdentifier: "PTImageController") as? PTImageController)!
       }
}

struct CellNib {
    static let NewsListCell       = UINib(nibName: CellIdentifier.NewsListCell, bundle: nil)
    static let NewsFilterCell     = UINib(nibName: CellIdentifier.NewsFilterCell, bundle: nil)
    
}

struct CellIdentifier {
    static let NewsListCell       = "PTNewsListCell"
    static let NewsFilterCell     = "PTFilterNewsCell"
}
struct Strings {
    static let AlertOk = "Ok"
    static let AlertTitle = "Practical test"
    static let FailureOperation = "Something went wrong. Please try again later"
    static let Done = "Done"
    static let AlerYES = "Yes"
    static let AlertCancel = "Cancel"
    static let appTitle = "Coinstelly"
    static let appTitleDetail = "Coinstelly"
}
struct APIName {
    static var APINewsList = baseURL + "top-headlines"
    
}
struct Keys {
    static let APIKey = "7ef6c6ad69394f70947a9f4a83b37864"
}

