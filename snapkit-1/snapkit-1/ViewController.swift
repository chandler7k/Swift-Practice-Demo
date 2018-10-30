//
//  ViewController.swift
//  snapkit-1
//
//  Created by ChandlerZou on 2018/10/30.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    lazy var box = UIView()
    lazy var box2 = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        box.backgroundColor = UIColor.red
        box2.backgroundColor = UIColor.yellow
        
        self.view.addSubview(box)
        self.view.addSubview(box2)
        box.snp.makeConstraints { (make) in
            make.height.width.equalTo(200)
            make.center.equalTo(self.view)
//            make.left.equalTo(20)
//            make.right.equalTo(-20)
//            make.top.equalTo(20)
//            make.height.equalTo(40)
        }
        
        box2.snp.makeConstraints { (make) in
//            make.height.width.equalTo(100)
//            make.right.equalTo(0)
//            make.bottom.equalTo(0)
//            make.left.equalTo(box)
//            make.height.width.equalTo(box)
//            make.top.equalTo(box.snp.bottom)
//            make.edges.equalTo(box).inset(UIEdgeInsets(top: 10, left: 15, bottom: 20, right: 25))
            make.center.equalTo(box)
//            make.size.equalTo(box).offset(-50)
            make.size.equalTo(box).multipliedBy(0.5)
        }
        
        
    }


}

