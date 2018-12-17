//
//  ThirdViewController.swift
//  HCI
//
//  Created by Tarek Morsi on 12/16/18.
//  Copyright © 2018 Abdelrahman El Kerdani. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    var imageArray = [Image]()
//    var imageViews = [UIImageView]()

    @IBOutlet weak var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.generateImagesFromURLs()
        
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.backgroundColor = UIColor.white
        
        print(imageArray)
        print("ThirdViewController: " + imageArray.debugDescription)
    
    }
//
//    func generateImagesFromURLs(){
//        for image in imageArray{
//            let imageView = UIImageView(image: nil)
//            imageView.imageFromServerURL(urlString: image.Url)
//            imageViews.append(imageView)
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (self.imageArray.count == 0) {
            collectionView.setEmptyMessage("No Results Found")
        } else {
            collectionView.restore()
        }
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.tagImage.imageFromServerURL(urlString: imageArray[indexPath.item].Url)
        return cell
    }
    
   
    @IBAction func Reset(_ sender: Any) {
        if let vc = self.presentingViewController as? SecondViewController{
            vc.presentingViewController?.dismiss(animated: true, completion: nil)
        }else{
            self.presentingViewController?.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension UICollectionView {
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel;
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
