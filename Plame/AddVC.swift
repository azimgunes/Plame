//
//  AddVC.swift
//  Plame
//
//  Created by Azim Güneş on 26.04.2023.
//

import UIKit

class AddVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    
    @IBOutlet weak var nameText: UITextField!
    
    
    @IBOutlet weak var typeText: UITextField!
    
    
    @IBOutlet weak var detailsText: UITextField!
    
    
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
         
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        let backImage = UIImageView(frame: UIScreen.main.bounds)
        backImage.image = UIImage(named: "page")
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

    
    
    
    @IBAction func nextPageButton(_ sender: Any) {
        
        if nameText.text != "" && typeText.text != "" && detailsText.text != "" {
           
            if let chosenImage = imageView.image {
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = nameText.text!
                placeModel.placeType = typeText.text!
                placeModel.placeDetail = detailsText.text!
                placeModel.placeImage = chosenImage
                
                
            }
            self.performSegue(withIdentifier: "toMapVC", sender: nil)

        }else {
            let alert = UIAlertController(title: "Hata!", message: "İsim/Tip/Detay?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Tamam!", style: UIAlertAction.Style.default)
            alert.addAction(okButton)
            present(alert, animated: true)
        }
    }
    
    @objc func chooseImage(){
         let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
}
