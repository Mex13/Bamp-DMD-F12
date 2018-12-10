import Foundation
import MapKit
import UIKit


class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
  let locationManager = CLLocationManager()

    override func viewDidLoad() {
    super.viewDidLoad()
        
        for anotation in Firebase.annottions {
        mapView.addAnnotation(annotation)
        }
        
    }
  
}
extension MapViewController: MKMapViewDelegate {
    func mapView( mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let annotation = annotation as? MapAnnotation else { return nil}
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeudView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeudView.annotation = annotation
            view = dequeudView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        view.markerTintColor = annotation.color
        
        return view
        }
    }
extension MapViewController: CLLocationManagerDelegate {
//    
//    func locationManager ( _ manager: CLLocationManager, didEnterRegion region: CLRegion)
//    func locationManager( manager: CLLocationManager, didExitRegion region, CLRegion) {
//        print("Left - \(region.identifier)")
//    }
}

