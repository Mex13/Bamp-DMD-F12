import Foundation
import MapKit
import UIKit
import Firebase

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
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
            
 
            
            self.mapView.addAnnotations(self.filterBy(sportName: "Football"))
        }

        
    }
    
    func filterBy(sportName: String) -> [Sport] {
        return locations.filter({ sport -> Bool in
            return sport.type == sportName
        })
    }
  
}
//extension MapViewController: MKMapViewDelegate {
//    func mapView( mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        guard let annotation = annotation as? MapAnnotation else { return nil}
//
//        let identifier = "marker"
//        var view: MKMarkerAnnotationView
//
//        if let dequeudView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//            as? MKMarkerAnnotationView {
//            dequeudView.annotation = annotation
//            view = dequeudView
//        } else {
//            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            view.canShowCallout = true
//            view.calloutOffset = CGPoint(x: -5, y: 5)
//            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        }
//
//        view.markerTintColor = annotation.color
//
//        return view
//        }
//    }
extension MapViewController: CLLocationManagerDelegate {
//    
//    func locationManager ( _ manager: CLLocationManager, didEnterRegion region: CLRegion)
//    func locationManager( manager: CLLocationManager, didExitRegion region, CLRegion) {
//        print("Left - \(region.identifier)")
//    }
}

