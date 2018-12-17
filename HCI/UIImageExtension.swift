//
//  UIImageExtension.swift
//  HCI
//
//  Created by Tarek Morsi on 12/16/18.
//  Copyright © 2018 Abdelrahman El Kerdani. All rights reserved.
//

import UIKit

extension UIImageView {
    
    public func imageFromServerURL(urlString: String) {
        self.image = nil
        let urlStringNew = urlString.replacingOccurrences(of: " ", with: "%20")
        URLSession.shared.dataTask(with: NSURL(string: urlStringNew)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error as Any)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }

    
//
//        func downloadImage(from url : String){
//            self.activityIndicator.startAnimating()
//            let urlRequest = URLRequest(url: URL(string: url)!)
//            let task = URLSession.shared.dataTask(with: urlRequest){(data,response,error)in
//                if error != nil {
//                    DispatchQueue.main.async {
//                        self.activityIndicator.stopAnimating()
//                    }
//                    print("error...")
//                }
//                else {
//                    DispatchQueue.main.async {
//                        self.activityIndicator.stopAnimating()
//                        self.image = UIImage(data:data!)
//                    }
//                }
//            }
//            task.resume()
//        }
//
//        fileprivate var activityIndicator: UIActivityIndicatorView {
//            get {
//                let activityIndicator = UIActivityIndicatorView(style: .white)
//                activityIndicator.hidesWhenStopped = true
//                activityIndicator.center = CGPoint(x:self.frame.width/2,
//                                                   y: self.frame.height/2)
//                activityIndicator.stopAnimating()
//                self.addSubview(activityIndicator)
//                return activityIndicator
//            }
//        }
    
}
