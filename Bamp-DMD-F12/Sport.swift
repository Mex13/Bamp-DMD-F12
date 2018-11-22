import Firebase
import MapKit

class Sport: NSObject, MKAnnotation {
    
    @objc dynamic var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
    var title: String? {
        return name
    }
    
    var subtitle: String? {
        return status
    }
    let location: GeoPoint
    let name: String?
    
    init(snapshot: QueryDocumentSnapshot) {
        guard let location = snapshot.data()["location"] as? GeoPoint else {return nil}
        self.location = location
        name = snapshot.documentID
        status = snapshot.data()["status"] as? String
}
