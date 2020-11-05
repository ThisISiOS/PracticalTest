//
//  PTDetailsController.swift
//  PracticalTest
//
//  Created by Hetal Patel on 05/11/20.
//  Copyright © 2020 Hetal Patel. All rights reserved.
//

import UIKit
import SDWebImage

class PTDetailsController: UIViewController {
    @IBOutlet weak var author: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    var article : PTArticles?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setArticle()
        self.setupImage()
        
        // Do any additional setup after loading the view.
    }
    func setupImage()
    {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        newsImage.isUserInteractionEnabled = true
        newsImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setArticle ()
    {
        self.newsTitle.text = article?.title
        self.newsDescription.text = article?.description
        self.author.text = article?.author
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy h:mm"
        let date = dateFormatter.date(from: article?.publishedAt ?? "")
        self.date.text =  self.article?.title?.formatDateToString(dateNew: date, format: "MM-dd-yyyy h:mm", isDate: true)
        
        self.newsImage?.sd_setImage(with: URL.init(string: article?.urlToImage ?? "")) { (image, error, cache, urls) in
            if (error != nil) {
                self.newsImage?.image = #imageLiteral(resourceName: "icn_Default")
            } else {
                self.newsImage.image = image
            }
        }
    }
    //MARK: Actions
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let vcNews = Controller.newsImageDetail
        vcNews.imageToSet = self.newsImage.image
        self.navigationController?.pushViewController(vcNews, animated: true)
        
    }
}
