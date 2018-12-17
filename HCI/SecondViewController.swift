//
//  SecondViewController.swift
//  HCI
//
//  Created by Tarek Morsi on 12/16/18.
//  Copyright © 2018 Abdelrahman El Kerdani. All rights reserved.
//

import UIKit
import Koloda

class SecondViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    
    var imageArray = [Image]()
    var imageViews = [UIImageView]()
    var selectedImages = [Image]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.generateImagesFromURLs()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        if(imageArray.isEmpty){
            let vc = ThirdViewController() //your view controller
            vc.imageArray = imageArray
            self.present(vc, animated: true, completion: nil)
        }
        
        
    }
    
    func generateImagesFromURLs(){
        for image in imageArray{
            let imageView = UIImageView(image: nil)
            imageView.imageFromServerURL(urlString: image.Url)
            imageViews.append(imageView)
        }
    }
    
    func checkIfSimilar(FirstArray:[String], SecondArray: [String])->Bool {
        var score = 0;
        for tag in FirstArray {
            if (SecondArray.contains(tag)){
                score = score + 1
            }
        }
        
        if(score>=5){
            return true
        }
        else {
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let thirdViewController = segue.destination as! ThirdViewController
        thirdViewController.imageArray = selectedImages;
    }
    
    @IBAction func Reset(_ sender: Any) {
        self.view.window!.rootViewController?.presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
}


extension SecondViewController: KolodaViewDelegate, KolodaViewDataSource{
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        performSegue(withIdentifier: "GoToResultsFromSecond", sender: self)
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
//        UIApplication.shared.openURL(URL(string: "https://yalantis.com/")!)
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        if(direction == SwipeResultDirection.right){
            selectedImages.append(imageArray[index])
        }
        
        if(direction == SwipeResultDirection.left){
            var imageToBeDeleted: [Image] = []
            for image in imageArray{
                if(checkIfSimilar(FirstArray: imageArray[index].Tags, SecondArray: image.Tags)){
                    imageToBeDeleted.append(image)
                }
            }
           
            imageArray = imageArray.filter { item in !imageToBeDeleted.contains(where: {$0.Url == item.Url} ) }
            imageViews.removeAll()
            generateImagesFromURLs()
            kolodaView.reloadData()
//            kolodaView.resetCurrentCardIndex()
            if(imageViews.isEmpty){
                performSegue(withIdentifier: "GoToResultsFromSecond", sender: self)
            }
        }
    }
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return imageArray.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        if(index > imageViews.count-1){
            performSegue(withIdentifier: "GoToResultsFromSecond", sender: self)
            return imageViews[0]
        }else{
            return imageViews[index]
        }
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("ImageOverlayView", owner: self, options: nil)?[0] as? ImageOverlayView
    }
    
}

