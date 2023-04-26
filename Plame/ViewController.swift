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
    
    
    @IBOutlet weak var userText: UITextField!
    
    
    @IBOutlet weak var passText: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
        
        let backImage = UIImageView(frame: UIScreen.main.bounds)
        backImage.image = UIImage(named: "mainnew")
        backImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backImage, at: 0)
        
    
    }
    
    
    @IBAction func signInButton(_ sender: Any) {
        if userText.text != "" && passText.text != "" {
            PFUser.logInWithUsername(inBackground: userText.text!, password: passText.text!) { user, error in
                if error != nil {
                    self.makeAlertMain(titleInput: "Hata!", messageInput: "Kullancı adı ya da şifrenizi hatalı girdiniz!")
                }else{
                    self.performSegue(withIdentifier: "toPlacesVC", sender: nil)
                }
            }
        }else {
            makeAlertMain(titleInput: "Hata!", messageInput: "Kullanıcı adı ya da şifrenizi girmediniz!")
        }
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toRegisterVC", sender: nil)
    }
    
    func makeAlertMain(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }    }


