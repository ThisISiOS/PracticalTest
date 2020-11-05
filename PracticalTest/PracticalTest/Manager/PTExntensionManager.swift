//
//  PTExntensionManager.swift
//  PracticalTest
//
//  Created by Hetal Patel on 05/11/20.
//  Copyright © 2020 Hetal Patel. All rights reserved.
//

import Foundation
import UIKit

extension String
{
    
    func formatDateToString(dateNew: Date?, format: String?, isDate: Bool) -> String? {
        let dateToday = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "dd MMM, yyyy hh:mm a"
        let formattedDate : String
        if let dateNew = dateNew {
            formattedDate = dateFormatter.string(from: dateNew)
        } else {
            formattedDate = dateFormatter.string(from: dateToday)
        }
        return formattedDate
    }
}
extension Calendar {
    //MARK:-
    
    static let gregorian = Calendar(identifier: .gregorian)
}
