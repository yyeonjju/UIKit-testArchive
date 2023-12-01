//
//  ViewController.swift
//  testArchive
//
//  Created by 하연주 on 2023/11/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var thirdView: UIView!
    
    private lazy var uiView : UIView! = .init(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
    
//    func layoutIfNeeded() {
//        button.transform = .init(rotationAngle:50)
//    }
    
//    override func viewDidAppear (_ animated : Bool) {
//        guard let button = button else {
//            print("🍑🍑🍑🍑🍑 버튼 없음")
//            return
//        }
//
//        button.transform = .init(rotationAngle:50)
//        super.viewDidAppear(true)
//
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        button.transform = .init(rotationAngle:50) // 왜 안바뀌지?
        uiView.transform = .init(rotationAngle:50) //uiView 잖아!!!!
          
//        // Do any additional setup after loading the view.
//
//        print("button.bounds => ",button.bounds)
//        print("button.bounds.size =>", button.bounds.size) //(100.0, 50.0)
//        print("button.bounds.origin => ", button.bounds.origin) //(0.0, 0.0)
////        button.bounds.origin.x = 50
////        button.bounds.origin.y = 50
////        print(button.bounds.origin) //(50.0, 50.0)
//
//        print("button.frame => ",button.frame)
//        print("button.frame.size => ", button.frame.size) //(100.0, 50.0)
//        print("button.frame.origin => ", button.frame.origin) //(146.66666666666666, 159.0)
//        button.frame.origin.x = 50
//        button.frame.origin.y = 50
//        print(button.frame.origin) //(50.0, 50.0)
        
        uiView.backgroundColor = .black
        view.addSubview(uiView)
        
        NSLayoutConstraint.activate([
            uiView.widthAnchor.constraint(equalToConstant: 180),
            uiView.heightAnchor.constraint(equalToConstant: 70),
            uiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uiView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        uiView.translatesAutoresizingMaskIntoConstraints = false
        

        
//        view.bounds.origin = CGPoint(x: 50, y: 200)
//        print(secondView.bounds)
////        secondView.frame.origin = CGPoint(x: 100, y: 50)
//        secondView.bounds.origin = CGPoint(x: 30, y: 10)
//        print(secondView.bounds)
        
        
        
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("🍑🍑🍑🍑🍑 버튼 누름")
        button.transform = .init(rotationAngle:50)
    }
    

}

