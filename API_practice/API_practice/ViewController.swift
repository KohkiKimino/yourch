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
    
    var articles: [[String: String?]] = [] // 記事を入れるプロパティを定義
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Qiita Client"

        table.frame = view.frame
        view.addSubview(table)
        table.dataSource = self
        table.delegate = self

        getArticles()
    }
    
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
            ] // 1つの記事を表す辞書型を作る
            self.articles.append(article) // 配列に入れる
        }
        self.table.reloadData()
            //print(self.articles) // 全ての記事が保存出来たら配列を確認
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell") // Subtitleのあるセルを生成
        let article = articles[indexPath.row] // 行数番目の記事を取得
        cell.textLabel?.text = article["title"]! // 記事のタイトルをtextLabelにセット
        cell.detailTextLabel?.text = article["userId"]! // 投稿者のユーザーIDをdetailTextLabelにセット
        return cell // cellを返す
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = detailViewController()
        //let article = articles[indexPath.row]
        //let detail = article["url"]!
        vc.viewDidLoad()
        
        self.navigationController?.pushViewController(vc, animated: true)
}
}
