//
//  ViewController.swift
//  8-SwiftyWods
//
//  Created by ChandlerZou on 2018/5/13.
//  Copyright © 2018年 zouhuanlin. All rights reserved.
//

import UIKit
import GameplayKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        for subview in view.subviews where subview.tag == 1001{
            let btn = subview as! UIButton
            letterButtons.append(btn)
            btn.addTarget(self, action: #selector(letterTapped(btn:)), for: .touchUpInside)
        }
        loadLevel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var cluseLabel: UILabel!
    @IBOutlet weak var answersLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var currentAnswer: UITextField!
    var letterButtons = [UIButton]()
    var activateButtons = [UIButton]()
    var solutions = [String]()
    
    var score = 0{
        didSet{
            scoreLabel.text = "Score: \(score)"
        }
    }
    var level = 1
    
    
    @IBAction func submitTapped(_ sender: Any) {
        //congif btn taped
        
        //巧妙啊
        if let solutionPosition = solutions.index(of: currentAnswer.text!){
            activateButtons.removeAll()
            
            var splitAnswers = answersLabel.text!.components(separatedBy: "\n")
            splitAnswers[solutionPosition] = currentAnswer.text!
            answersLabel.text = splitAnswers.joined(separator: "\n")
            
            currentAnswer.text = ""
            score += 1
            
            if score % 7 == 0{
                let ac = UIAlertController(title: "Well Done", message: "Are you ready for next level?", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Let's go", style: .default, handler: levelUp))
                present(ac, animated: true)
            }
        }else{
            let ac = UIAlertController(title: "Wrong Answer", message: "you wrong", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Try again", style: .cancel, handler: nil))
            present(ac, animated: true)
        }
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        currentAnswer.text = ""
        
        for btn in activateButtons{
            btn.isHidden = false
        }
        
        activateButtons.removeAll()
    }
    
    //MARK: - private methods
    @objc func letterTapped(btn: UIButton){
        currentAnswer.text = currentAnswer.text! + btn.titleLabel!.text!
        activateButtons.append(btn)
        btn.isHidden = true
    }
    
    func loadLevel(){
        var clueString = ""
        var solutionString = ""
        var letterBits = [String]()
        
        if let levelFilePath = Bundle.main.path(forResource: "level\(level)", ofType: "txt"){
            if let levelContent = try? String(contentsOfFile: levelFilePath){
                var lines = levelContent.components(separatedBy: "\n")
                lines = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: lines) as! [String]
                for (index,line) in lines.enumerated(){
                    let parts = line.components(separatedBy: ":")
                    let answer = parts[0]
                    let clue = parts[1]
                    
                    clueString += "\(index + 1). \(clue)\n"
                    
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    solutionString += "\(solutionWord.count) letters\n"
                    solutions.append(solutionWord)
                    
                    let bits = answer.components(separatedBy: "|")
                    letterBits += bits
                }
            }
        }
        cluseLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
        answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
        
        letterBits = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: letterBits) as! [String]
        
        if letterBits.count == letterButtons.count{
            for i in 0 ..< letterBits.count{
                letterButtons[i].setTitle(letterBits[i], for: .normal)
            }
        }
    }
    
    func levelUp(action: UIAlertAction){
        level += 1
        solutions.removeAll(keepingCapacity: true)
        
        loadLevel()
        for btn in letterButtons{
            btn.isHidden = true
        }
    }
    
    
    
  
    
    
    
    
    
}

