//
//  ViewController.swift
//  4-PlayLocalVideo
//
//  Created by ChandlerZou on 2018/4/27.
//  Copyright © 2018年 zouhuanlin. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var videoTableView: UITableView!
    
    @IBAction func playVideoButtonTaped(){
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        playViewController.player = playerView
        self.present(playViewController, animated: true){
            self.playViewController.player?.play()
        }
    }
    
    var data = [
        
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
        
    ]
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoTableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        let video = data[indexPath.row]
        cell.videoScreenShot.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        return cell
        
    }
}

