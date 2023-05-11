//
//  ProfileVC.swift
//  Plame
//
//  Created by Azim Güneş on 11.05.2023.
//

import UIKit
import Parse

class ProfileVC: UIViewController {

    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    var placeID = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backImage = UIImageView(frame: UIScreen.main.bounds)
        backImage.image = UIImage(named: "page")
        backImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backImage, at: 0)
        

        // Do any additional setup after loading the view.
    }

   
    @IBAction func logOut(_ sender: Any) {
        PFUser.logOutInBackground { error in
            if error != nil {
                self.makeAlert(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Hata! ")
            }else {
                self.performSegue(withIdentifier: "fromPVCtoVC", sender: nil)
            }
        }
    }
    
    func makeAlert(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Hata", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    
}


