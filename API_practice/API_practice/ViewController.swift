//
//  ViewController.swift
//  CocoapodsSample5
//
//  Created by MACUser on 2020/07/02.
//  Copyright © 2020 MACUser. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import WebKit


class ArticleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableView: UITableView!
    
    var articles: [[String: String?]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Qiita Client"

        TableView.frame = view.frame
        TableView.dataSource = self
        TableView.delegate = self

        getArticles()
    }
    //Qiita記事を持ってくる
    func getArticles() { Alamofire.request( "https://qiita.com/api/v2/items?page=1&per_page=20").responseJSON {
        res in
        guard let returnValue = res.result.value else {
            return
        }
        let json = JSON(returnValue)
        json.forEach { (_, json) in
            let article: [String: String?] = [
                "title": json["title"].string,
                "userId": json["user"]["id"].string,
                "url": json["url"].string
            ]
            self.articles.append(article)
        }
        self.TableView.reloadData()
        }
    }
    //表示したいセル数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    //タイトルとIDをセット
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article["title"]!
        cell.detailTextLabel?.text = article["userId"]!
        return cell
    }
    //画面遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = detailViewController()
        let article = articles[(indexPath).row]
        let detail = article["url"]!
        vc.url = detail!
        self.navigationController?.pushViewController(vc, animated: true)
        }
}
