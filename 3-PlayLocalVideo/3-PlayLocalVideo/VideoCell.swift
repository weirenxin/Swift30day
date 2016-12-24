//
//  VideoCell.swift
//  3-PlayLocalVideo
//
//  Created by weirenxin on 2016/12/24.
//  Copyright © 2016年 广西家饰宝科技有限公司. All rights reserved.
//

import UIKit

struct video {
    
    let image: String
    let title: String
    let source: String
    
}

class VideoCell: UITableViewCell {

    @IBOutlet weak var screenshot: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
