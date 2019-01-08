import Foundation
import MapKit
import UIKit
import Firebase

class MapViewController: UIViewController {
//this class is about the MapView. This class is showing pins on our map, which are taking information from Firebase.
    
    @IBOutlet weak var mapView: MKMapView!
    
    var sportType: SportType!
    
    @IBAction func Back(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
  let locationManager = CLLocationManager()
    //this is to configure, start and stop core location services.
    var locations = [Sport]()
    override func viewDidLoad() {
    super.viewDidLoad()
        
        let ref = Firestore.firestore().collection("Locations")
        ref.getDocuments { snapshot, error in
            guard let snapshot = snapshot else { return }
            
            for document in snapshot.documents {
                if let location = Sport(snapshot: document) {
                    self.locations.append(location)
                }
            }
            self.mapView.addAnnotations(self.filterBy(sportName: self.sportType.name))
            self.mapView.showAnnotations(self.mapView.annotations, animated: true)
 //this allows the location of a certain sport to be found depending on the sport type selected.
        }
    }
    
    
    func filterBy(sportName: String) -> [Sport] {
        return locations.filter({ sport -> Bool in
            return sport.type == sportName
 //this returns the screen back to the selection page after already selecting a sport type.
        })
    }
  
}
extension MapViewController: CLLocationManagerDelegate {
   }


