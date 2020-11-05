//
//  PTAPIManager.swift
//  PracticalTest
//
//  Created by Hetal Patel on 05/11/20.
//  Copyright © 2020 Hetal Patel. All rights reserved.
//


import Foundation
import Alamofire


class PTAPIManager: NSObject {
    static let manager = PTAPIManager()
    fileprivate override init() { }

    //GET API
       func getAPI(APIName: String, params: [String : AnyObject]?, success: @escaping (_ response: [String:Any]) -> (), failure: @escaping (_ error: Error?) -> ()) {
           
           let todoEndpoint: String = APIName

           self.makeRequestAPI(withMethod: .get, withURL: todoEndpoint, parameters: nil, headers: nil, success: success, failure: failure)
       }
    
    fileprivate func makeRequestAPI(withMethod method: HTTPMethod = .get, withURL url: String, parameters: [String: Any]? = nil, headers : Dictionary<String, String>? = nil, success: @escaping (_ response: [String:Any]) -> (), failure: @escaping (_ error: Error?) -> ()) {
        debugPrint("API \(#function)")
        debugPrint("URL: \(url)")
        debugPrint("parameters: \(parameters?.count ?? 0)")
        debugPrint("headers: \(headers ?? [:])")
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            
            if let error = response.result.error {
                debugPrint("\(#function) error: \(error.localizedDescription)")
                failure(response.result.error)
            } else if let json = response.result.value as? [String: Any] {
                debugPrint("\(#function) success")
                success(json)
            } else {
                debugPrint("\(#function) response: \(response)")
            }
        }
    }
}
