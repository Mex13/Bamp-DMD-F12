import Firebase
import MapKit

class Sport: NSObject, MKAnnotation {
    
    @objc dynamic var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
    
    var title: String? {
        return name
    }
    
    let location: GeoPoint
    let name: String
    let type: String
    
    init?(snapshot: QueryDocumentSnapshot) {
        guard let location = snapshot.data()["Location"] as? GeoPoint else {return nil}
        self.location = location
        name = snapshot.data()["Name"] as! String
        type = snapshot.data()["Type"] as! String
    }
}
