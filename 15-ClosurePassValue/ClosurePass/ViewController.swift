//
//  ViewController.swift
//  ClosurePass
//
//  Created by ChandlerZou on 2018/9/11.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var showButton: UIButton!
      
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupButton()
    }
    
    
    func setupButton(){
        showButton.addTarget(self, action: #selector(showViewController), for: .touchUpInside)
    }
    
    @objc func showViewController(){
        let secVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as!  SecondViewController
        secVC.content = self.textLabel.text
        secVC.passValue = {
            (text:String) in
            self.textLabel.text = text
        }
        present(secVC,animated: true)
    }


}

