//
//  MapVC.swift
//  Plame
//
//  Created by Azim Güneş on 26.04.2023.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let backImage = UIImageView(frame: UIScreen.main.bounds)
        backImage.image = UIImage(named: "page")
        backImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backImage, at: 0)
        // Do any additional setup after loading the view.
    }
    

    @IBAction func savePlaceButton(_ sender: Any) {
    }
    
}
