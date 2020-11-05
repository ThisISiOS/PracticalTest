//
//  PTListController.swift
//  PracticalTest
//
//  Created by Hetal Patel on 05/11/20.
//  Copyright © 2020 Hetal Patel. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire

class PTListController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    @IBOutlet weak var filterCollection: UICollectionView!
    
    var news : [PTArticles] = []
    var filter = ["All" ,"Business", "Gadgets","Sport","Video"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Strings.appTitle
        self.getNews()
        self.setupCollectionview()
    }
    func setupTableview ()
    {
        self.newsTableView.register(CellNib.NewsListCell, forCellReuseIdentifier: CellIdentifier.NewsListCell)
        self.newsTableView.rowHeight = UITableView.automaticDimension
        self.newsTableView.estimatedRowHeight = UITableView.automaticDimension
        self.newsTableView.delegate = self
        self.newsTableView.dataSource = self
        self.newsTableView.reloadData()
    }
    func setupCollectionview()
    {
        self.filterCollection.register(CellNib.NewsFilterCell, forCellWithReuseIdentifier: CellIdentifier.NewsFilterCell)
        self.filterCollection.delegate = self
        self.filterCollection.dataSource = self
        self.filterCollection.reloadData()
    }
    @objc func newsLinkClicked(_ sender : UIButton)
    {
        
         let vcLink = Controller.web
                   vcLink.linkURL = self.news[sender.tag].url ?? ""
                self.navigationController?.pushViewController(vcLink, animated: true)
        
    }
}

extension PTListController
{
    //MARK: API
    func getNews()
    {
        let parameters = [
            "sources=google-news",
            "apiKey=\(Keys.APIKey)"
            ].joined(separator: "&")
        let URL = "\(APIName.APINewsList)?\(parameters)"
        PTAPIManager.manager.getAPI(APIName: URL, params:[:], success: { (response) in
            DispatchQueue.main.async {
                debugPrint(response.count)
                let appDataRes = Mapper<PTListResponse>().map(JSON: response)
                debugPrint(appDataRes!)
                self.news = appDataRes?.articles ?? [PTArticles()]
                self.setupTableview()
                PTProgressHUDManager.showKRProgressHUD(false)
            }
        }) { (error) in
            DispatchQueue.main.async {
                PTProgressHUDManager.showKRProgressHUD(false)
            }
        }
    }
}

extension PTListController : UITableViewDelegate , UITableViewDataSource
{
    //MARK: Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.NewsListCell, for: indexPath) as? PTNewsListCell
        {
            cell.article = news[indexPath.row]
            cell.newsLink.tag = indexPath.row
            cell.newsLink.addTarget(self,action: #selector(newsLinkClicked),for : .touchUpInside)
            
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)    {

    let vcDetail = Controller.newsDetail
           vcDetail.article = self.news[indexPath.row]
        self.navigationController?.pushViewController(vcDetail, animated: true)
    }
}

extension PTListController : UICollectionViewDelegate , UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell  =  collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.NewsFilterCell, for: indexPath) as? PTFilterNewsCell
        {
            cell.title.text = self.filter[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    
}
