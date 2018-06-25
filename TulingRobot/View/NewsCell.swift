//
//  NewsCell.swift
//  TulingRobot
//
//  Created by wuxi on 2018/6/25.
//  Copyright © 2018年 demo. All rights reserved.
//

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {

    
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var authorLb: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(model: NewsModel) {
        title.text = model.title
        pic.sd_setImage(with: URL(string: model.thumbnail_pic_s), completed: nil)
        authorLb.text = "\(model.author_name) \(model.date)"
    }
    
}
