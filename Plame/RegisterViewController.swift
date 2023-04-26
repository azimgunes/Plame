//
//  RegisterViewController.swift
//  Plame
//
//  Created by Azim Güneş on 23.04.2023.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {
    
    
    
    @IBOutlet weak var scrollImage: UIImageView!
    
    
    @IBOutlet weak var topicLabel: UILabel!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var mailText: UITextField!
    
    
    @IBOutlet weak var passText: UITextField!
    
    
    @IBOutlet weak var countryText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        scrollImage.addGestureRecognizer(tapGestureRecognizer)
        scrollImage.isUserInteractionEnabled = true
        
        
        let backImage = UIImageView(frame: UIScreen.main.bounds)
        backImage.image = UIImage(named: "register")
        backImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backImage, at: 0)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func saveButton(_ sender: Any) {
        if mailText.text != "" && passText.text != "" {
             let user = PFUser()
            user.username = usernameText.text!
            user.password = passText.text!
            user.email = mailText.text!
            
            user.signUpInBackground { success, error in
                if error != nil {
                    self.makeAlertRegister(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Hata!")
                }else {
                    //Segue
                    self.performSegue(withIdentifier: "toViewController", sender: nil)
                }
            }
        }else {
            makeAlertRegister(titleInput: "HATA!", messageInput: "Bütün alanların doğru bir şekilde doldurulması zorunludur!")
        }
    }
    
    @objc func imageTapped(){
        self.performSegue(withIdentifier: "toViewController", sender: nil)
}
    
    func makeAlertRegister(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
