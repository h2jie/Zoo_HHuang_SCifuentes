//
//  ViewController.swift
//  Zoo_HHuang_SCifuentes
//
//  Created by Hangjie Huang on 2018/4/10.
//  Copyright © 2018年 Hangjie Huang. All rights reserved.
//

import UIKit
import AudioToolbox

class AnimalDescriptionViewController: UIViewController {


    private let BUTTON_WIDTH: CGFloat = 150.0
    private let BUTTON_HEIGHT: CGFloat = 50.0

    @IBOutlet weak var animalImageView: UIImageView!

    var animalImageToDisplay: UIImage?
    var buttonStart = UIButton(type: UIButtonType.system)
    var buttonStop = UIButton(type: UIButtonType.system)
    
    var animalSoundID:SystemSoundID = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        animalImageView.isUserInteractionEnabled = true
        
        if let animal = animalImageToDisplay {

            self.animalImageView.image = animal
            self.navigationItem.title = animal.accessibilityIdentifier
        }

        switch self.navigationItem.title {
        case "Dog":
            print("dog")
            var imagesArray: Array<UIImage> = []
            for index in 0...9 {
                let name: String = "dog\(index)"
                let image: UIImage = UIImage(named: name)!
                imagesArray.append(image)
            }


            animalImageView.image = imagesArray[0]
            animalImageView.animationImages = imagesArray
            animalImageView.animationDuration = 2.0

            //Button Start animacion
            buttonStart.frame = CGRect(x: self.view.frame.width / 2 - BUTTON_WIDTH / 2, y: self.view.frame.height - BUTTON_HEIGHT - 100, width: BUTTON_WIDTH, height: BUTTON_HEIGHT)
            buttonStart.setTitle("Start Animation", for: UIControlState.normal)
            buttonStart.addTarget(self, action: #selector(touchUpStartAnimation), for: UIControlEvents.touchUpInside)
            self.view.addSubview(buttonStart)

            //Button Stop animacion
            buttonStop.frame = buttonStart.frame
            buttonStop.setTitle("Stop Animation", for: UIControlState.normal)
            buttonStop.addTarget(self, action: #selector(touchUpStopAnimation), for: UIControlEvents.touchUpInside)
            self.view.addSubview(buttonStop)
            buttonStop.isHidden = true

        case "Cat":
            print("cat")
            var imagesArray: Array<UIImage> = []
            for index in 0...8 {
                let name: String = "cat\(index)"
                let image: UIImage = UIImage(named: name)!
                imagesArray.append(image)
            }
            
            
            animalImageView.image = imagesArray[0]
            animalImageView.animationImages = imagesArray
            animalImageView.animationDuration = 2.0
            
            //Button Start animacion
            buttonStart.frame = CGRect(x: self.view.frame.width / 2 - BUTTON_WIDTH / 2, y: self.view.frame.height - BUTTON_HEIGHT - 100, width: BUTTON_WIDTH, height: BUTTON_HEIGHT)
            buttonStart.setTitle("Start Animation", for: UIControlState.normal)
            buttonStart.addTarget(self, action: #selector(touchUpStartAnimation), for: UIControlEvents.touchUpInside)
            self.view.addSubview(buttonStart)
            
            //Button Stop animacion
            buttonStop.frame = buttonStart.frame
            buttonStop.setTitle("Stop Animation", for: UIControlState.normal)
            buttonStop.addTarget(self, action: #selector(touchUpStopAnimation), for: UIControlEvents.touchUpInside)
            self.view.addSubview(buttonStop)
            buttonStop.isHidden = true
            
        case "Cow":
            let pinchRecognizer = UIPinchGestureRecognizer(
                target: self, action: #selector(changeScale(byReactingTo:))
            )
            animalImageView.addGestureRecognizer(pinchRecognizer)
            animalImageView.setNeedsDisplay()
            
        case "Chicken":
            let pinchRecognizer = UIPinchGestureRecognizer(
                target: self, action: #selector(changeScale(byReactingTo:))
            )
            animalImageView.addGestureRecognizer(pinchRecognizer)
            animalImageView.setNeedsDisplay()
            
        case "Snake":
            let rotationRecognizer = UIRotationGestureRecognizer(
                target: self,
                action: #selector(rotationAnimation)
            )
            rotationRecognizer.rotation = CGFloat(90*Double.pi/180)
            animalImageView.addGestureRecognizer(rotationRecognizer)
            animalImageView.setNeedsDisplay()
            
        case "Pig":
            let swipeUpRecognizer = UISwipeGestureRecognizer(
                target: self, action: #selector(swipeUpAnimation)
            )
            swipeUpRecognizer.direction = UISwipeGestureRecognizerDirection.up
            animalImageView.addGestureRecognizer(swipeUpRecognizer)
            animalImageView.setNeedsDisplay()
            
        default:
            print("nada")
        }

        if let animalSoundURL = Bundle.main.url(forResource: self.navigationItem.title, withExtension: "mp3"){
            AudioServicesCreateSystemSoundID(animalSoundURL as CFURL, &animalSoundID)
        }

    }
    
    @objc func changeScale(byReactingTo pinchRecognizer:UIPinchGestureRecognizer){
        switch pinchRecognizer.state {
        case .changed, .ended:
            //print("changeScale")
            var auxSize = animalImageView.frame.size
            auxSize.height *= pinchRecognizer.scale
            auxSize.width *= pinchRecognizer.scale
            animalImageView.frame.size = auxSize
            pinchRecognizer.scale = 1
            
        default: break
        }
    }
    
    @objc func swipeUpAnimation(){
        let animator = UIViewPropertyAnimator(
            duration: 2,
            curve: UIViewAnimationCurve.linear,
            animations: {
                self.animalImageView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.height / 2 - self.view.frame.height)
            }
        )
        animator.addCompletion{ finished in
            let secondAnimator = UIViewPropertyAnimator(
                duration: 4,
                curve: UIViewAnimationCurve.easeOut,
                animations: {
                    self.animalImageView.transform = CGAffineTransform.identity
                }
            )
            secondAnimator.startAnimation()
        }
        animator.startAnimation()
    }
    
    @objc func rotationAnimation(){
        let animator = UIViewPropertyAnimator(
            duration: 3,
            curve: UIViewAnimationCurve.easeIn,
            animations: {
                self.animalImageView.transform = CGAffineTransform(rotationAngle: CGFloat(180*Double.pi/180))
            }
        )
        animator.addCompletion{ finished in
            let secondAnimator = UIViewPropertyAnimator(
                duration: 3,
                curve: UIViewAnimationCurve.easeOut,
                animations: {
                    self.animalImageView.transform = CGAffineTransform.identity
                }
            )
            secondAnimator.startAnimation()
        }
        animator.startAnimation()
    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        AudioServicesPlaySystemSound(animalSoundID)
    }

    @IBAction func touchUpStartAnimation(_ sender: UIButton) {
        buttonStart.isHidden = true
        buttonStop.isHidden = false
        animalImageView.startAnimating()
    }

    @IBAction func touchUpStopAnimation(_ sender: UIButton) {
        buttonStart.isHidden = false
        buttonStop.isHidden = true
        animalImageView.stopAnimating()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

