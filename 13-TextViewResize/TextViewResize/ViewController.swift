//
//  ViewController.swift
//  TextViewResize
//
//  Created by ChandlerZou on 2018/8/30.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

import UIKit
import NotificationCenter
class ViewController: UIViewController,UITextViewDelegate {

    
    var noteTextView: UITextView = {
        var textView = UITextView()
        textView.backgroundColor = UIColor.gray
        textView.font = UIFont.systemFont(ofSize: 23)
        textView.tintColor = UIColor.white
        textView.frame = CGRect(x: 20, y: 100, width: UIScreen.main.bounds.width - 40 , height: UIScreen.main.bounds.height - 200)
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(noteTextView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleWillShowNotification(notification:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleWillHideNotification(notification:)), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    
    
    
    @objc func handleWillShowNotification(notification: Notification){
        if let userInfo = notification.userInfo{
            let keyboardFrame = userInfo[UIWindow.keyboardFrameEndUserInfoKey] as? CGRect
            let keyboardHeight = keyboardFrame?.height
            
            noteTextView.frame = CGRect(x: 20, y: 100, width: UIScreen.main.bounds.width - 40 , height: UIScreen.main.bounds.height - keyboardHeight! - 200)
            
            UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
                self.noteTextView.layoutIfNeeded()
            }, completion: nil
            )
        }
    }
    @objc func handleWillHideNotification(notification: Notification){
        noteTextView.frame = CGRect(x: 20, y: 100, width: UIScreen.main.bounds.width - 40 , height: UIScreen.main.bounds.height - 200)
        
        UIView.animate(withDuration: 0, delay: 0, options: .curveEaseOut, animations: {
            self.noteTextView.layoutIfNeeded()
        }, completion: nil
        )
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
        
    }
    
    
    

}



