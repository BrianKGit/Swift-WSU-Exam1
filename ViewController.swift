//
//  ViewController.swift
//  Exam1
//
//  Created by GeggHarrison, Timothy S on 9/24/19.
//  Copyright © 2019 Tim Gegg-Harrison. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let myLabel: UILabel = UILabel()
    private let myLabel2: UILabel = UILabel()
    private var startingPoint: CGPoint = CGPoint(x: 0, y: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.orange
         
        myLabel.text = "CS 345"
        myLabel.backgroundColor = UIColor.clear
        myLabel.textColor = UIColor.white
        myLabel.textAlignment = NSTextAlignment.center
        myLabel2.frame = CGRect(x: view.center.x-125, y: view.frame.minY+125, width: 250, height: 50)
        myLabel2.text = "Brian Klein"
        myLabel2.backgroundColor = UIColor.clear
        myLabel2.textColor = UIColor.white
        myLabel2.textAlignment = NSTextAlignment.center
        view.addSubview(myLabel)
        view.addSubview(myLabel2)
        
        var myImage: UIImageView = UIImageView(frame: CGRect(x: 40, y: 200, width: 115, height: 176))
        myImage.image = UIImage(named: "KC")
        myImage.isUserInteractionEnabled = true
        myImage.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(_ :))))
        
        view.addSubview(myImage)
        
        myImage = UIImageView(frame: CGRect(x: view.frame.width-155, y: 200, width: 115, height: 176))
        myImage.image = UIImage(named: "KH")
        myImage.highlightedImage = UIImage(named: "QH")
        myImage.isUserInteractionEnabled = true
        myImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap2(_ :))))
        myImage.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan2(_ :))))
        
        view.addSubview(myImage)
        
        myImage = UIImageView(frame: CGRect(x: 40, y: 400, width: 115, height: 176))
        myImage.image = UIImage(named: "KD")
        myImage.isUserInteractionEnabled = true
        myImage.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(ViewController.handleHorizontalPan(_ :))))
        
        view.addSubview(myImage)

        myImage = UIImageView(frame: CGRect(x: view.frame.width-155, y: 400, width: 115, height: 176))
        myImage.image = UIImage(named: "KS")
        myImage.isUserInteractionEnabled = true
        myImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(_ :))))
        
        view.addSubview(myImage)

    }
    
    @objc func handlePan(_ recognizer: UIPanGestureRecognizer) {
        if recognizer.state == UIGestureRecognizer.State.began {
            startingPoint = recognizer.view!.center
            recognizer.view?.superview?.bringSubviewToFront(recognizer.view!)
        }
        let translation: CGPoint = recognizer.translation(in: view)
        recognizer.view?.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPoint(x: 0, y: 0), in: view)
        if recognizer.state == UIGestureRecognizer.State.cancelled {
                recognizer.view?.center = startingPoint
            }
        }
    
    @objc func handlePan2(_ recognizer: UIPanGestureRecognizer) {
        if let card: UIImageView = recognizer.view as? UIImageView {
            if card.isHighlighted {
                if recognizer.state == UIGestureRecognizer.State.began {
                    startingPoint = recognizer.view!.center
                    recognizer.view?.superview?.bringSubviewToFront(recognizer.view!)
                }
                let translation: CGPoint = recognizer.translation(in: view)
                recognizer.view?.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y + translation.y)
                recognizer.setTranslation(CGPoint(x: 0, y: 0), in: view)
                if recognizer.state == UIGestureRecognizer.State.cancelled {
                    recognizer.view?.center = startingPoint
                }
            }
        }
    }
    
    @objc func handleHorizontalPan(_ recognizer: UIPanGestureRecognizer) {
        if recognizer.state == UIGestureRecognizer.State.began {
            startingPoint = recognizer.view!.center
            recognizer.view?.superview?.bringSubviewToFront(recognizer.view!)
        }
        let translation: CGPoint = recognizer.translation(in: view)
        recognizer.view?.center = CGPoint(x: recognizer.view!.center.x + translation.x, y: recognizer.view!.center.y)
        recognizer.setTranslation(CGPoint(x: 0, y: 0), in: view)
        if recognizer.state == UIGestureRecognizer.State.cancelled {
            recognizer.view?.center = startingPoint
        }
    }
    
    @objc func handleTap(_ recognizer: UIGestureRecognizer) {
        recognizer.view?.removeFromSuperview()
    }
    
    @objc func handleTap2(_ recognizer: UIGestureRecognizer) {
        if let card: UIImageView = recognizer.view as? UIImageView {
            if (card.isHighlighted) {
                card.isHighlighted = false
            }
            else {
                card.isHighlighted = true
            }
        }
    }
    
}




