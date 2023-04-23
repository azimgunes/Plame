//
//  RegisterViewController.swift
//  Plame
//
//  Created by Azim Güneş on 23.04.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    
    @IBOutlet weak var scrollImage: UIImageView!
    
    
    @IBOutlet weak var topicLabel: UILabel!
    
    
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
    }
    
    @objc func imageTapped(){
        self.performSegue(withIdentifier: "toViewController", sender: nil)
}
}
