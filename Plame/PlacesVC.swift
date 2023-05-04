//
//  PlacesVC.swift
//  Plame
//
//  Created by Azim Güneş on 26.04.2023.
//
import Parse
import UIKit

class PlacesVC: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!

    
    var placeNameArray = [String]()
    var placeIdArray = [String]()
    
    
    override func viewDidLoad() {
       
        tableView.delegate = self
        tableView.dataSource = self
        
        let backImage = UIImageView(frame: UIScreen.main.bounds)
        backImage.image = UIImage(named: "page")
        backImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backImage, at: 0)

        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addButton))
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(title: "Çıkış Yap", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutButton))
        
        navigationController?.navigationBar.tintColor = .darkGray
        
      print(getDataFromParse())
    }

    
    @objc func addButton(){
        self.performSegue(withIdentifier: "toAddVC", sender: nil)
    }
 
    @objc func logoutButton(){
        PFUser.logOutInBackground { error in
            if error != nil {
                self.makeAlert(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Hata! ")
            }else {
                self.performSegue(withIdentifier: "toVC", sender: nil)
            }
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = placeNameArray[indexPath.row]
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.highlightedTextColor = UIColor.white
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeNameArray.count
    }
    
   @objc func getDataFromParse(){
        let query = PFQuery(className: "Memories")
        query.findObjectsInBackground { objects, error in
            if error != nil {
                self.makeAlert(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Hata!")
            }else {
                if objects != nil {
                    self.placeNameArray.removeAll(keepingCapacity: false)
                    self.placeIdArray.removeAll(keepingCapacity: false)
                    
                    for object in objects! {
                        if let placeName = object.object(forKey: "name") as? String {
                            if let placeId = object.objectId {
                                self.placeNameArray.append(placeName)
                                self.placeIdArray.append(placeId)
                                self.tableView.reloadData()
                               
                            }
                        }
                    }
                }
                
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
