//
//  ViewController.swift
//  Operation-1
//
//  Created by ChandlerZou on 2018/10/8.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        cell.textLabel?.text = "hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPath.row == 3 ? showCollectionVC() : showViewController(row: indexPath.row)
    }
    
    let tableView:UITableView = {
        let tb = UITableView()
        tb.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return tb
    }()
    
    let cellID = "cellid"
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    
    
    func showViewController(row: Int){
        let basicVC = self.storyboard?.instantiateViewController(withIdentifier:"Basic") as! BasicViewController
        basicVC.whichway = row
        present(basicVC, animated: true, completion: nil)
    }
    func showCollectionVC(){
        let cvc = self.storyboard?.instantiateViewController(withIdentifier: "CollectionV") as! CollectionViewController
        present(cvc, animated: true, completion: nil)
    }

    
    
    

}

