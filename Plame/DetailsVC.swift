//
//  DetailsVC.swift
//  Plame
//
//  Created by Azim Güneş on 26.04.2023.
//

import UIKit
import MapKit
import Parse

class DetailsVC: UIViewController {

    @IBOutlet weak var getImageView: UIImageView!
    
    @IBOutlet weak var getNameLabel: UILabel!
    
    @IBOutlet weak var getTypeLabel: UILabel!
    
    @IBOutlet weak var getDetailsLabel: UILabel!
    
    @IBOutlet weak var getMapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}
