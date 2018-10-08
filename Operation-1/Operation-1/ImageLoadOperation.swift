//
//  ImageLoadOperation.swift
//  Operation-1
//
//  Created by ChandlerZou on 2018/10/8.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

import UIKit

class ImageLoadOperation: Operation {
    var item: Item
    var dataTask: URLSessionDataTask?
    var complete: ((UIImage?) -> Void)
    
    init(item: Item, complete: @escaping (UIImage?) -> Void){
        self.item = item
        self.complete = complete
        super.init()
    }
    
    fileprivate var _executing: Bool = false
    override var isExecuting: Bool{
        get{
            return _executing
        }
        set{
            if newValue != _executing{
                willChangeValue(forKey: "isExecuting")
                _executing = newValue
                didChangeValue(forKey: "isExecuting")
            }
        }
    }
    
    
    fileprivate var _finished : Bool = false
    override var isFinished: Bool {
        get { return _finished }
        set {
            if newValue != _finished {
                willChangeValue(forKey: "isFinished")
                _finished = newValue
                didChangeValue(forKey: "isFinished")
            }
        }
    }
    
    
    override var isAsynchronous: Bool{
        get{
            return true
        }
    }
    
    override func start() {
        if !isCancelled{
            isExecuting = true
            isFinished = false
            startOperation()
        }else{
            isExecuting = false
        }
        
        if let url = item.imageUrl(){
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data{
                    let image = UIImage(data: data)
                    self.endOperation(image: image)
                }else{
                    self.endOperation(image: nil)
                }
            }
            dataTask.resume()
        }else{
            self.endOperation(image: nil)
        }
    }
    
    override func cancel() {
        if !isCancelled{
            cancelOperation()
        }
        super.cancel()
        completeOperation()
    }
    func cancelOperation(){
        dataTask?.cancel()
    }
    
    func startOperation(){
        completeOperation()
    }
    
    func completeOperation(){
        if isExecuting && !isFinished{
            isExecuting = false
            isFinished = true
        }
    }
    
    
    func endOperation(image: UIImage?){
        if !isCancelled{
            complete(image)
            completeOperation()
            
        }
    }
}
