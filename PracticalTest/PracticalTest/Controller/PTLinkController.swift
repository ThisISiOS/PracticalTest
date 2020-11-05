//
//  PTLinkController.swift
//  PracticalTest
//
//  Created by Hetal Patel on 05/11/20.
//  Copyright © 2020 Hetal Patel. All rights reserved.
//

import UIKit
import WebKit

class PTLinkController: UIViewController {
    
    @IBOutlet weak var wkNewsLink: WKWebView!
    var linkURL : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupWebview()
    }
    
    func setupWebview()
    {
        let link = URL(string:linkURL ?? "")!
        let request = URLRequest(url: link)
        self.wkNewsLink.load(request)
    }
    
}
