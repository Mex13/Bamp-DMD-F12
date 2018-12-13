import Foundation
import MapKit
import UIKit
import Firebase

class MapViewController: UIViewController {
//this class is about the MapView. This class is showing pins on our map, which are takin informations from Firebase.
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func Back(_ sender: Any) {
         self.performSegue(withIdentifier: "Back", sender: nil)
         self.dismiss(animated: true, completion: nil)
    }
  let locationManager = CLLocationManager()
    
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
            self.mapView.addAnnotations(self.filterBy(sportName: "Golf"))
        }
    }
    
    func filterBy(sportName: String) -> [Sport] {
        return locations.filter({ sport -> Bool in
            return sport.type == sportName
        })
    }
  
}
extension MapViewController: CLLocationManagerDelegate {
   }


