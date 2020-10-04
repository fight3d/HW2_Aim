//
//  ViewController.swift
//  HW2_Aim
//
//  Created by 3droot on 04.10.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawAim(number: 4, thickness: 50, size: 500, round: true)
    }

    func drawAim(number: Int, thickness: CGFloat, size: CGFloat, round: Bool){
        //create parent view for aim
        let aimView = UIView()
        aimView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        
        //create layers of aim
        for i in 0...number {
            let aimSubView = UIView()
            let currentSize = size - CGFloat(i)*thickness*2
            aimSubView.frame = CGRect(x: 0, y: 0, width: currentSize, height: currentSize)
            if round {
                aimSubView.layer.cornerRadius = aimSubView.frame.width/2
            }
            if i % 2 == 0 {
                aimSubView.backgroundColor = UIColor.blue
            } else {
                aimSubView.backgroundColor = UIColor.red
            }
            
            alignViews(myView: aimSubView, parentView: aimView)
            aimView.addSubview(aimSubView)
            if aimSubView.frame.size.width < thickness*2 {
                break
            }
        }
        
        //align aimView and show
        alignViews(myView: aimView, parentView: view)
        view.addSubview(aimView)
    }
    
    func alignViews (myView: UIView, parentView: UIView){
        myView.frame.origin.x = parentView.frame.midX - myView.frame.width/2
        myView.frame.origin.y = parentView.frame.midY - myView.frame.height/2
    }
 
}

