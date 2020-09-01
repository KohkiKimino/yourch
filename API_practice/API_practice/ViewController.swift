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
    
    @IBOutlet weak var tableView: UITableView!
    
    var articles: [[String: String?]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Qiita Client"

        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self

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
        self.tableView.reloadData()
        }
    }
    //表示したいセル数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    //タイトルとIDをセット
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
       let article = articles[indexPath.row]
       cell.title.text = article["title"]!
       cell.id.text = article["userId"]!
       
       return cell
    }
 
    //画面遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = detailViewController()
        let article = articles[(indexPath).row]
        let detail = article["url"]!
        vc.url = detail!
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        }
}
