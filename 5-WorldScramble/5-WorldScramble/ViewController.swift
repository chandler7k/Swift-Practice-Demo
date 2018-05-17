//
//  ViewController.swift
//  5-WorldScramble
//
//  Created by ChandlerZou on 2018/5/9.
//  Copyright © 2018年 zouhuanlin. All rights reserved.
//

import UIKit
import GameplayKit
class ViewController: UITableViewController {
    var allWords = [String]()
    var useWords = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promtAnswer))
        if let startWoldPath = Bundle.main.path(forResource: "start", ofType: "txt"){
            if let startWords = try? String(contentsOfFile: startWoldPath){
                allWords = startWords.components(separatedBy: "\n")
            }
        }else{
            allWords = ["silkWorms"]
        }
        
        startGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - private method
    func startGame(){
        beginGame()
        useWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    func beginGame(){
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allWords) as! [String]
        title = allWords[0]
    }
    
    @objc func promtAnswer(){
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAnswer = UIAlertAction(title: "Submit", style: .default){
            [unowned self , ac] (action: UIAlertAction) in
            let answer = ac.textFields![0]
            self.submit(answer: answer.text!)
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        ac.addAction(submitAnswer)
        present(ac, animated:true)
    }
    
    func submit(answer: String){
        let lowerAnswer = answer.lowercased()
        let errorTitle: String
        let errorMessage: String
        
        if isPossible(word: lowerAnswer){
            if isOriginal(word: lowerAnswer){
                if isReal(word: lowerAnswer){
                    useWords.insert(answer, at: 0)
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    beginGame()
                    return //直接退出
                }else{
                    errorTitle = "Word not recognised"
                    errorMessage = "You can't just make them up, you know!"
                }
            }else{
                errorTitle = "Word used already!"
                errorMessage = "Be more origin"
            }
        }else {
            errorTitle = "Word not possible"
            errorMessage = "You can't spell that word from '\(title!.lowercased())'!"
        }
        
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
       
        present(ac, animated: true)
    }
    
    func isPossible(word: String) -> Bool{
        var tempWord = title!.lowercased()
        for letter in word{
            if let pos = tempWord.range(of: String(letter)){
                tempWord.remove(at: pos.lowerBound)
            }else{
                return false
            }
        }
        return true
    }
    
    func isOriginal(word: String) -> Bool{
        return !useWords.contains(word)
    }
    
    func isReal(word: String) -> Bool{
//        return true
        let checker = UITextChecker()
        let range = NSMakeRange(0, word.utf16.count)
        let misSpelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misSpelledRange.location == NSNotFound
        
    }
    
    
    // MARK: - table view delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return useWords.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.text = useWords[indexPath.row]
        return cell
        
    }
    
}

