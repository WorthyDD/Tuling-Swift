//
//  WebViewController.swift
//  TulingRobot
//
//  Created by me on 2018/6/25.
//  Copyright © 2018年 demo. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class WebViewController: UIViewController {

    var webView = WKWebView()
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(webView)
        webView.snp.makeConstraints { (make) in
            make.left.right.bottom.top.equalTo(0)
        }
        if url.count > 0 {
            let request = URLRequest(url: URL(string: url)!)
            webView.load(request)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
