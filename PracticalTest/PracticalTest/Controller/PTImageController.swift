//
//  PTImageController.swift
//  PracticalTest
//
//  Created by Hetal Patel on 05/11/20.
//  Copyright © 2020 Hetal Patel. All rights reserved.
//

import UIKit

class PTImageController: UIViewController {
    
    @IBOutlet weak var imageScrollview: UIScrollView!
    @IBOutlet weak var newsImage: UIImageView!
    var imageToSet : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageScrollview.delegate = self
        newsImage.image = imageToSet
        self.setZoom()
        // Do any additional setup after loading the view.
    }
    
    func setZoom()
    {
        newsImage.isUserInteractionEnabled = true
        imageScrollview.minimumZoomScale = 1.0
        imageScrollview.maximumZoomScale = 6.0
        imageScrollview.contentSize = .init(width: 2000, height: 2000)
    }
}
extension PTImageController : UIScrollViewDelegate
{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        self.newsImage
    }
}
