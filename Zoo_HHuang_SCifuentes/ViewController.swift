//
//  ViewController.swift
//  Zoo_HHuang_SCifuentes
//
//  Created by Hangjie Huang on 2018/4/10.
//  Copyright © 2018年 Hangjie Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        /*var imagesArray:Array<UIImage>=[]
        for index in 0...9{
            let name:String="dog\(index)"
            let image:UIImage=UIImage(named: name)!
            imagesArray.append(image)
        }
        */
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(self.tapOfSound(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        
    }

    @objc func tapOfSound(_ sender: UITapGestureRecognizer) {
        print("sound")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

