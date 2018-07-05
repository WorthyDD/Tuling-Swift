//
//  NewsListController.swift
//  TulingRobot
//
//  Created by me on 2018/6/24.
//  Copyright © 2018年 demo. All rights reserved.
//

import UIKit
import MJRefresh

class NewsListController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var news: [NewsModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "头条"
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.reloadNews()
        })
        tableView.mj_header.beginRefreshing()
    }

    func reloadNews() {
        NewsModel.getNewsModel { (data) in
            self.tableView.mj_header.endRefreshing()
            if data != nil {
                self.news = data!
                self.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 99
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let data = news[indexPath.row]
        cell.updateCell(model: data)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WebViewController()
        let data = news[indexPath.row]
        vc.url = data.url
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
