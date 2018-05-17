//
//  ViewController.swift
//  HackingWithSwift-2
//
//  Created by ChandlerZou on 2018/4/24.
//  Copyright © 2018年 zouhuanlin. All rights reserved.
//
import GameplayKit
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1:UIButton!
    @IBOutlet weak var button2:UIButton!
    @IBOutlet weak var button3:UIButton!
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        askQestion(action: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func askQestion(action: UIAlertAction! = nil){
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
        
    }
    
    @IBAction func buttonTaped(_ sender: UIButton){
        var title:String
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }else {
            title = "Wrong"
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Yout score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "continue", style: .default, handler: askQestion))
        present(ac,animated: true)
        
    }


}

