//
//  DetailViewController.swift
//  HackingWithSwift-1-StormView
//
//  Created by ChandlerZou on 2018/4/23.
//  Copyright © 2018年 zouhuanlin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
        }
        navigationItem.largeTitleDisplayMode = .never
//        navigationController?.hidesBarsOnTap = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return navigationController?.hidesBarsOnTap ?? false
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
