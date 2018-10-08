//
//  BasicViewController.swift
//  Operation-1
//
//  Created by ChandlerZou on 2018/10/8.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    var imageViews: [UIImageView]?
    let operationQueue = OperationQueue()
    var whichway: Int?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageViews = [imageView1,imageView2,imageView3,imageView4]
    }
    
    @IBAction func start(_ sender: UIButton) {
        
        switch whichway {
        case 0:
            basicLoad()
        case 1:
            priorityLoad()
        case 2:
            depencyLoad()
        default:
            return
            
        }
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func basicLoad(){
        operationQueue.maxConcurrentOperationCount = 3
        print("start basic loading")
        for imageView in imageViews!{
            operationQueue.addOperation {
                if let url = URL(string: "https://placebeard.it/355/140"){
                    do{
                        let image = UIImage(data: try Data(contentsOf: url))
                        DispatchQueue.main.async {
                            imageView.image = image
                        }
                    }catch{
                        print(error)
                    }
                }
            }
        }
        
    }
    
    func priorityLoad(){
        print("priorty loading")
        operationQueue.maxConcurrentOperationCount = 2
        var operations = [Operation]()
        for (index, imageV) in imageViews!.enumerated(){
            if let url = URL(string: "https://placebeard.it/355/140"){
                let operation = ConvenienceOperation(imageView: imageV, url: url)
                switch index{
                case 0:
                    operation.queuePriority = .veryHigh
                case 1:
                    operation.queuePriority = .high
                case 2:
                    operation.queuePriority = .normal
                case 3:
                    operation.queuePriority = .low
                default:
                    return
                }
                operations.append(operation)
            }
        }
        
        DispatchQueue.global().async {
            self.operationQueue.addOperations(operations, waitUntilFinished: true)
            DispatchQueue.main.async {
                print("done")
            }
        }
        
    }
    
    func depencyLoad(){
        print("depency Load")
        operationQueue.maxConcurrentOperationCount = 4
        guard let url = URL(string: "https://placebeard.it/355/140") else{return}
        let op1 = ConvenienceOperation(imageView: imageView1, url: url)
        let op2 = ConvenienceOperation(imageView: imageView2, url: url)
        op2.addDependency(op1)
        let op3 = ConvenienceOperation(imageView: imageView3, url: url)
        op3.addDependency(op2)
        let op4 = ConvenienceOperation(imageView: imageView4, url: url)
        op4.addDependency(op3)
        DispatchQueue.global().async {
            self.operationQueue.addOperations([op1,op2,op3,op4], waitUntilFinished: true)
            DispatchQueue.main.async {
                print("done")
            }
        }
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

class ConvenienceOperation: Operation {
    var url: URL
    var imageView: UIImageView
    
    init(imageView: UIImageView, url: URL){
        
        self.imageView = imageView
        self.url = url
        super.init()
    }
    
    override func main() {
        do{
            if isCancelled{
                return
            }
            let imageData = try Data(contentsOf: url)
            let image = UIImage(data: imageData)
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
            
            
            
        }catch{
            print(error)
        }
            
    }
}
