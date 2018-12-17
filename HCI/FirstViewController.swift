//
//  ViewController.swift
//  HCI
//
//  Created by Abdelrahman El Kerdani on 12/16/18.
//  Copyright © 2018 Abdelrahman El Kerdani. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var logoImage: UIImageView!
    
    var imageArray = [Image]()
    var filteredArray = [Image]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.constructImagesArray()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchTextField.text = ""
        filteredArray = []
    }
    
    func constructImagesArray(){
        
        imageArray.append(Image(Url:"https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/Natural-Dog-Law-2-To-dogs%2C-energy-is-everything.jpg?itok=Z-ujUOUr",
                                Tags:["dog","jumping","happy","sea","beach","summer","jumping dog", "white dog"],
                                Accepted: false,
                                Viewed: false))
        
        imageArray.append(Image(Url:"http://www.royalcanin.in/var/royalcanin/storage/images/subsidiaries/in/home/puppy-and-dog/the-dog/dogs-that-serve-man/rescue-dogs/389164-6-eng-GB/rescue-dogs_articleV3.png",
                                Tags:["dog","jumping","security dog","garden","jumping dog", "german sheppard", "black dog"],
                                Accepted: false,
                                Viewed: false))
        
        imageArray.append(Image( Url:"https://www.thesprucepets.com/thmb/7damYd5bY0VMLkvPEdL5AHv2vDQ=/425x250/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/27579948_547443672291161_4754606380961234944_n-5a70c2ac31283400364b124b.jpg",
                                 Tags:["dog","happy dog","two dogs","golden retreiver","birthday dog","golden dog"],
                                 Accepted: false,
                                 Viewed: false))
        imageArray.append(Image(Url:"https://www.cesarsway.com/sites/newcesarsway/files/styles/large_article_preview/public/Roverprotective-when-dogs-watch-out-too-much.jpg?itok=mrpX4K2Z",
                                Tags:["dog","boxer dog","brown dog","white dog","dog with owner", "man", "hug"],
                                Accepted: false,
                                Viewed: false))
        imageArray.append(Image(  Url:"https://images.mentalfloss.com/sites/default/files/styles/mf_image_16x9/public/51153-iStock-485392746.jpg?itok=QhDTvEB1&resize=1100x1100",
                                  Tags:["dog", "golden dog", "dog with owner", "man", "hug", "love"],
                                  Accepted: false,
                                  Viewed: false))
        imageArray.append(Image(Url:"https://www.petmd.com/sites/default/files/puppy-exercise-shutterstock_135867833_0.jpg",
                                Tags:["dog","puppy","brown dog","white dog", "dog with owner", "man", "dog training", "puppy training", "labrador dog"],
                                Accepted: false,
                                Viewed: false))
        imageArray.append(Image(Url:"https://www.pets4homes.co.uk/images/articles/3462/are-you-a-well-trained-dog-owner-56b61ef6a59a1.jpg",
                                Tags:["dog","golden retreiver","golden dog", "dog with owner", "women", "dog training", "dog handshake"],
                                Accepted: false,
                                Viewed: false))
        imageArray.append(Image(  Url:"https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12193133/German-Shepherd-Puppy-Fetch.jpg",
                                  Tags:["dog","german sheppard","black dog", "puppy", "puppy training", "dog training", "jumping dog", "garden"],
                                  Accepted: false,
                                  Viewed: false))
        imageArray.append(Image( Url:"https://www.telegraph.co.uk/content/dam/Pets/spark/pets-at-home-2017/fluffy-white-puppy.jpg?imwidth=1400",
                                 Tags:["dog","white dog","puppy", "puppy training", "dog training", "jumping dog", "garden"],
                                 Accepted: false,
                                 Viewed: false))
        imageArray.append(Image( Url:"https://www.kathysantodogtraining.com/wp-content/uploads/puppy-playing.jpg",
                                 Tags:["dog","black dog","rottweiler","puppy", "puppy training", "dog training", "jumping dog", "garden"],
                                 Accepted: false,
                                 Viewed: false))
        imageArray.append(Image(Url:"https://image.shutterstock.com/image-vector/vector-illustration-cartoon-dog-450w-131012516.jpg",
                                Tags:["dog","cartoon dog","grey dog", "bone", "dog with bone", "shutterstock"],
                                Accepted: false,
                                Viewed: false))
        imageArray.append(Image( Url:"https://image.shutterstock.com/image-vector/dog-cartoon-450w-124931459.jpg",
                                 Tags:["dog","cartoon dog","golden dog", "happy", "shutterstock"],
                                 Accepted: false,
                                 Viewed: false))
        imageArray.append(Image( Url:"https://image.shutterstock.com/image-vector/happy-dog-cartoon-450w-399897679.jpg",
                                 Tags:["dog","cartoon dog","golden dog", "happy", "red collar", "shutterstock"],
                                 Accepted: false,
                                 Viewed: false))
        imageArray.append(Image(Url:"https://images.pexels.com/photos/208134/pexels-photo-208134.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                                Tags:["boy","blonde","yellow hair", "white boy", "green tshirt","happy","kid"],
                                Accepted: false,
                                Viewed: false))
        imageArray.append(Image(Url:"https://us.hola.com/en/imagenes/lifestyle/2017120810920/russian-girl-most-beautiful-in-world/0-17-240/anastasia-most-beautiful-t.jpg",
                                Tags:["girl","brown hair", "white girl", "blue jacket","happy", "kid"],
                                Accepted: false,
                                Viewed: false))
        
        
    }


    @IBAction func Search(_ sender: UIButton) {
        for image in imageArray {
            if(image.Tags.contains(searchTextField.text!)) {
                filteredArray.append(image)
            }
        }
        
        if(!filteredArray.isEmpty){
            performSegue(withIdentifier: "GoToSelectionFromFirst", sender: self)
        }else{
            performSegue(withIdentifier: "GoToResultsFromFirst", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(!filteredArray.isEmpty){
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.imageArray = filteredArray;
        }else{
            let thirdViewController = segue.destination as! ThirdViewController
            thirdViewController.imageArray = []
        }
       
    }
    
}
