//
//  ViewController.swift
//  Zoo_HHuang_SCifuentes
//
//  Created by Hangjie Huang on 2018/4/10.
//  Copyright © 2018年 Hangjie Huang. All rights reserved.
//

import UIKit

class AnimalDescriptionViewController: UIViewController {


    private let BUTTON_WIDTH: CGFloat = 150.0
    private let BUTTON_HEIGHT: CGFloat = 50.0

    @IBOutlet weak var animalImageView: UIImageView!

    var animalImageToDisplay: UIImage?
    var buttonStart = UIButton(type: UIButtonType.system)
    var buttonStop = UIButton(type: UIButtonType.system)


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

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
            buttonStart.addTarget(self, action: #selector(touchUpStopAnimation), for: UIControlEvents.touchUpInside)
            self.view.addSubview(buttonStart)

            //Button Stop animacion
            buttonStop.frame = buttonStart.frame

        case "Cat":
            print("cat")
        default:
            print("nada")
        }


//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapOfSound(_:)))
//        animalImageView.isUserInteractionEnabled = true
//        animalImageView.addGestureRecognizer(tapGestureRecognizer)


    }

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        print("tap")
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

