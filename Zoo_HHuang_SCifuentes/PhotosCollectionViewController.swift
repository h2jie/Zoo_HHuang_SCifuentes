//
//  PhotosCollectionViewController.swift
//  Zoo_HHuang_SCifuentes
//
//  Created by Hangjie Huang on 2018/4/17.
//  Copyright © 2018年 Hangjie Huang. All rights reserved.
//

import UIKit
import AVFoundation

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {

    var backgroundAudioPlayer: AVAudioPlayer?

    let photos = ["Dog", "Cat", "Cow", "Chicken", "Snake", "Pig"]
    

    @IBAction func Audio(_ sender: UIBarButtonItem) {
        
        switch sender.title {
        case "Audio On":
            sender.title = "Audio Off"
            
            if let backgroundURL = Bundle.main.url(forResource: "Zoo", withExtension: "mp3") {
                do {
                    try backgroundAudioPlayer = AVAudioPlayer(contentsOf: backgroundURL)
                    if let player = backgroundAudioPlayer {
                        player.stop()
                        
                    }
                } catch {
                    print("Setting AVAudioPlayer failed.")
                }
            }
            
        case "Audio Off":
            sender.title = "Audio On"
            
            if let backgroundURL = Bundle.main.url(forResource: "Zoo", withExtension: "mp3") {
                do {
                    try backgroundAudioPlayer = AVAudioPlayer(contentsOf: backgroundURL)
                    if let player = backgroundAudioPlayer {
                        player.numberOfLoops = Int(-1)
                        player.prepareToPlay()
                        player.play()
                        
                    }
                } catch {
                    print("Setting AVAudioPlayer failed.")
                }
            }
        default:
            break
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            try AVAudioSession.sharedInstance().setActive(true)

        } catch {
            print("Setting active to AVAudioSessionCategoryPlayback failed")
        }
        if let backgroundURL = Bundle.main.url(forResource: "Zoo", withExtension: "mp3") {
            do {
                try backgroundAudioPlayer = AVAudioPlayer(contentsOf: backgroundURL)
                if let player = backgroundAudioPlayer {
                    player.numberOfLoops = Int(-1)
                    player.prepareToPlay()
                    player.play()
                    
                }
            } catch {
                print("Setting AVAudioPlayer failed.")
            }
        }


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.

    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if let advc = segue.destination as? AnimalDescriptionViewController {
            if let cell = sender as? AnimalViewCell {
                if let indexPath = collectionView?.indexPath(for: cell) {
                    let animal = UIImage(named: photos[indexPath.row])
                    animal?.accessibilityIdentifier = photos[indexPath.row]
                    advc.animalImageToDisplay = animal

                }
            }
        }


    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AnimalViewCell

        cell.imageView.image = UIImage(named: photos[indexPath.row])
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
