//
//  Snap2ViewController.swift
//  snapkit-1
//
//  Created by ChandlerZou on 2018/10/30.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

import UIKit
import SnapKit
class Snap2ViewController: UIViewController {
    
    
    lazy var box = UIView()
    var sizeConstraint: Constraint?
    var topConstraint: Constraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        box.backgroundColor = UIColor.orange
        // Do any additional setup after loading the view.
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) in
//            self.sizeConstraint = make.width.height.equalTo(150).constraint
//            make.center.equalTo(self.view)
            make.height.width.equalTo(200)
            make.centerX.equalTo(self.view)
            self.topConstraint = make.top.equalTo(100).offset(30).constraint
        }
        
        
    }
    

    @IBAction func buttonTaped(_ sender: Any) {
//        self.sizeConstraint?.deactivate()
        self.topConstraint?.update(offset: 60)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
