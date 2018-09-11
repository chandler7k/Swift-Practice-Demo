//
//  SecondViewController.swift
//  ClosurePass
//
//  Created by ChandlerZou on 2018/9/11.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    var passValue:((String) ->())!
    var content: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        self.textField.text = content
        // Do any additional setup after loading the view.
    }
    
    func setupBackButton(){
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    @objc func back(){
        self.passValue(self.textField.text!)
        self.dismiss(animated: true, completion: nil)
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
