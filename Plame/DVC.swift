//
//  DVC.swift
//  Plame
//
//  Created by Azim Güneş on 4.05.2023.
//

import UIKit
import Parse
import MapKit

class DVC: UIViewController{
    
    
    @IBOutlet weak var getImage: UIImageView!
    @IBOutlet weak var getName: UILabel!
    @IBOutlet weak var getType: UILabel!
    @IBOutlet weak var getDetail: UILabel?
    @IBOutlet weak var getMap: MKMapView!
    
    var chosenLatitude = Double()
    var chosenLongitude = Double()
 
    var placeID = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backImage = UIImageView(frame: UIScreen.main.bounds)
        backImage.image = UIImage(named: "otherpage")
        backImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backImage, at: 0)
        
   
    getDataFromParse()

}
    
    func getDataFromParse(){
        
        let query = PFQuery(className: "Memories")
        query.whereKey("objectId", equalTo: placeID)
        query.findObjectsInBackground { (objects, error) in
            if error != nil {
                
            }else {
                if objects != nil {
                    if objects!.count > 0 {
                        let chosenObject = objects![0]
                        if let placeName = chosenObject.object(forKey: "name") as? String {
                            self.getName.text = placeName
                        }
                        if let placeType = chosenObject.object(forKey: "type") as? String {
                            self.getType.text = placeType
                        }
                        if let placeDetail = chosenObject.object(forKey: "Detail") as? String {
                            self.getDetail?.text = placeDetail
                        }
                        if let placeLatitude = chosenObject.object(forKey: "latitude") as? String {
                            if let placeLatitudeDouble = Double(placeLatitude){
                                self.chosenLatitude = placeLatitudeDouble
                        }
                            if let placeLongitude = chosenObject.object(forKey: "longitude") as? String {
                                if let placeLongitudeDouble = Double(placeLongitude){
                                    self.chosenLongitude = placeLongitudeDouble
                                }
                            }
                            
                            if let imageData = chosenObject.object(forKey: "image") as? PFFileObject{
                                imageData.getDataInBackground { data, error in
                                    if error == nil {
                                        if data != nil {
                                        self.getImage.image = UIImage(data: data!)
                                    }
                                        
                                    }
                                }
                            }
                            let location = CLLocationCoordinate2D(latitude: self.chosenLatitude, longitude: self.chosenLongitude)
                            let span = MKCoordinateSpan(latitudeDelta: 0.010, longitudeDelta: 0.010)
                            let region = MKCoordinateRegion(center: location, span: span)
                            self.getMap.setRegion(region, animated: true)
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = location
                            annotation.title  = self.getName.text!
                            annotation.subtitle = self.getDetail?.text!
                            self.getMap.addAnnotation(annotation)
                    }
                }
            }
    }
        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if pinView == nil {
            pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            let button = UIButton(type: .detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        } else {
            pinView?.annotation = annotation
        }
        return pinView
    }
  
 
    }
