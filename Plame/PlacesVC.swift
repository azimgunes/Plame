//
//  PlacesVC.swift
//  Plame
//
//  Created by Azim Güneş on 26.04.2023.
//
import Parse
import UIKit

class PlacesVC: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let backImage = UIImageView(frame: UIScreen.main.bounds)
        backImage.image = UIImage(named: "page")
        backImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backImage, at: 0)

        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButton))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Çıkış Yap", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutButton))
        
        navigationController?.navigationBar.tintColor = .darkGray
        
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
    
    
    
    @objc func addButton(){
        self.performSegue(withIdentifier: "toAddVC", sender: nil)
    }
 
    @objc func logoutButton(){
        PFUser.logOutInBackground { error in
            if error != nil {
                let alert = UIAlertController(title: "Hata!", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Hata", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true)
            }else {
                self.performSegue(withIdentifier: "toVC", sender: nil)
            }
        }
        
    }

}
