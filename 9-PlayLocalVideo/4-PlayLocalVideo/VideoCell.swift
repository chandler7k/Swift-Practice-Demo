//
//  VideoCell.swift
//  4-PlayLocalVideo
//
//  Created by ChandlerZou on 2018/4/27.
//  Copyright © 2018年 zouhuanlin. All rights reserved.
//

import UIKit
struct video {
    let image:String
    let title:String
    let source: String
}
class VideoCell: UITableViewCell {
//    @IBOutlet weak var viedoScreenShot: UIImage!
//    @IBOutlet weak var videoTitleLabel: UILabel!
//    @IBOutlet weak var videoSourceLabel: UILabel!
    
    @IBOutlet weak var videoScreenShot: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
