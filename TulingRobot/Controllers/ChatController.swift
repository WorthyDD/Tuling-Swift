//
//  ChatController.swift
//  TulingRobot
//
//  Created by me on 2018/6/24.
//  Copyright © 2018年 demo. All rights reserved.
//

import UIKit
import SVProgressHUD

class ChatController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var sendBtn: UIButton!
    var message: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "MessageCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    @IBAction func tapsend(_ sender: UIButton) {
        
        let text = tf.text ?? ""
        message.append("Q:\(text)")
        tf.text = ""
        tf.resignFirstResponder()
        tableView.reloadData()
        if text.count == 0 {
            SVProgressHUD.showInfo(withStatus: "文字不能为空")
            return
        }
        MessageModel.getAnswer(input: text) { (json) in
            SVProgressHUD.dismiss()
            if json != nil {
                let code = json!["code"].intValue
                if code > 10000 {
                    let text = json!["text"].rawString() ?? ""
                    var url = json!["url"].rawString() ?? ""
                    if url == "null" {
                        url = ""
                    }
                    let ans = "A:\(text) \(url)"
                    self.message.append(ans)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MessageCell
        let msg = message[indexPath.row]
        if msg.hasPrefix("Q") {
            cell.messageLb.textColor = UIColor.red
            cell.messageLb.textAlignment = .left
        }
        else {
            cell.messageLb.textColor = UIColor.black
            cell.messageLb.textAlignment = .right
        }
        cell.messageLb.text = msg
        return cell
    }
    
}
