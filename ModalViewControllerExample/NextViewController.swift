//
//  NextViewController.swift
//  ModalViewControllerExample
//
//  Created by Maciek on 17.06.2014.
//  Copyright (c) 2014 Maciek. All rights reserved.
//

import UIKit

//protocol HuhThing {
//    var setPresentingController: Int { get set }
//}

class NextViewController: UIViewController {
    
    let button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
    var presentingController: ViewController = ViewController()
    
    //TODO: make public
    func setPresentingController(controller: ViewController) {
        self.presentingController = controller
    }
    
    func clickBack() {
        println("clickBack()")
    }
    
    override func viewDidLoad() {
        println("NextViewController: viewDidLoad()")
        button.setTitle("Back", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
//        button.addTarget(self, action: "clickBack:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        let views = [
            "buttonBack": button
        ]
        
        let topMetrics = [
            "topMargin": UIScreen.mainScreen().bounds.height/2 - button.intrinsicContentSize().height/2
        ]
        
        button.sizeToFit()
//        let topConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-topMargin-[buttonBack(<=800)]-(>=100)-|", options: nil, metrics: topMetrics, views: views)
//        self.view.addConstraints(topConstraints)
    }
    
}