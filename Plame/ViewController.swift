//
//  ViewController.swift
//  Plame
//
//  Created by Azim Güneş on 18.04.2023.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    
    @IBOutlet weak var plameLabel: UILabel!
    
    
    @IBOutlet weak var mailText: UITextField!
    
    
    @IBOutlet weak var passText: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /* let parseObject = PFObject(className: "Memories")
        parseObject["When"] = "10 Mayıs"
        parseObject["Who"] = "Muhi"
        
        
       
        parseObject.saveInBackground { success, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print("Anılar Yüklendi")
            }
        }
        
        let parseNewObject = PFObject(className: "Places")
        parseNewObject["Where"] = "Germany"
        parseNewObject.saveInBackground { succ, errortwo in
            if errortwo != nil {
                print(errortwo?.localizedDescription)
            }else {
                print("Yerler Yüklendi.")
            }
        } */
        
        let backImage = UIImageView(frame: UIScreen.main.bounds)
        backImage.image = UIImage(named: "mainnew")
        backImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backImage, at: 0)
        
        let query = PFQuery(className: "Places")
         query.findObjectsInBackground { objects, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                print(objects)
            }
        }
        
    }
    
    
    @IBAction func signInButton(_ sender: Any) {
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toRegisterVC", sender: nil)
    }
    
    
    }


