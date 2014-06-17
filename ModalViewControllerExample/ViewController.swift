//
//  ViewController.swift
//  ModalViewControllerExample
//
//  Created by Maciek on 13.06.2014.
//  Copyright (c) 2014 Maciek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let debug = true;
    let autoresizingMask = false;
    
    var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
    var topConstraints: AnyObject[] = []
    var trailingConstraints: AnyObject[] = []
    
    func clickNext() {
        println("clickNext()")
        
        let nextViewController: NextViewController = NextViewController()
//        nextViewController.setP
        nextViewController.view.backgroundColor = UIColor.whiteColor()
        self.presentViewController(nextViewController, animated: true, completion: nil)
        
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator!) {
        self.view.removeConstraints(topConstraints)
        self.view.removeConstraints(trailingConstraints)
        self.view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        println("updateConstraints()")
        
        let views = [
            "button": button
        ]
        
        let topMetrics = [
            "topMargin": UIScreen.mainScreen().bounds.height/2 - button.intrinsicContentSize().height/2
        ]
        
        let trailingMetrics = [
            "trailingMargin": UIScreen.mainScreen().bounds.width/2 - button.intrinsicContentSize().width/2
        ]

        topConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-topMargin-[button(<=800)]-(>=100)-|", options: nil, metrics: topMetrics, views: views)
        trailingConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-trailingMargin-[button(<=800)]-(>=100)-|", options: nil, metrics: trailingMetrics, views: views)
        
//        if(self.view.bounds.height == 568.0) {
//            topConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-topMargin-[button(<=800)]-(>=100)-|", options: nil, metrics: metrics, views: views)
//            
//        } else if (self.view.bounds.height == 320.0) {
//            topConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-topMargin-[button(<=800)]-(>=100)-|", options: nil, metrics: metrics, views: views)
//        }
        self.view.addConstraints(topConstraints)
        self.view.addConstraints(trailingConstraints)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("viewDidLoad()")
        
        //Zaimplementowac w view requiresConstraintBasedLayout() na true
        
        let views = [
            "button": button
        ]
        
        let metrics = [
            "topMargin": UIScreen.mainScreen().bounds.height/2 - button.intrinsicContentSize().height/2,
            "trailingMargin": UIScreen.mainScreen().bounds.width/2 - button.intrinsicContentSize().width/2
        ]
        
        button.setTitle("Next", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.addTarget(self, action: "clickNext", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        if (!self.autoresizingMask) {
            println("AutoresizingMask mode OFF")
            button.setTranslatesAutoresizingMaskIntoConstraints(false)
//            constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-topMargin-[button(<=800)]-(>=100)-|", options: nil, metrics: metrics, views: views)
//            self.view.addConstraints(constraints)
        } else {
            button.sizeToFit()
            button.center = CGPointMake(UIScreen.mainScreen().bounds.width/2, UIScreen.mainScreen().bounds.height/2)
        }
        
        if (self.debug) {
            println("Debug mode ON")
            self.view.layer.borderColor = UIColor.redColor().CGColor
            self.view.layer.borderWidth = 1
            
            button.layer.borderColor = UIColor.redColor().CGColor
            button.layer.borderWidth = 1
            
            println("Button: \(button.tag)")
            println("button.intrinsicContentSize() \(button.intrinsicContentSize())")
            
//            for i in 0 .. self.view.constraints().count {
//                println("Constraint \(i): \(self.view.constraints()[i])")
//            }
        }
        
        println("View did load.")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

