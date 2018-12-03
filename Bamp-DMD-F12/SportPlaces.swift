import Firebase
import CoreLocation

protocol SportPlaceDelegate {
    func didUpdate()
}

class SportPlaces {
    let name: String!
    
    var delegate: SportplacesDelegate?
    var sports = [Sport]()
    
    init (name: String) {
        self.name = name
    }
    func startPlaceSport() {
        let ref = Firestore.firestore().collection("locations")
    
        re.getDocuments { snapshot, error in
    
            guard let snapshot = snapshot else { return }
            self.sports.removeAll()
            for document in snapshot.documents {
                if let sport = Sport(snapshot: document) {
                    self.fsports.append(friend)
                }
                self.delegate?.didUpdate()
            }
            
        }
        
    }
    func setLocation(_ location: CLLocation) {
        let ref = Firestore.firestore().collection("locations").document(name)
        let geo = GeoPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.latitude)
        ref.setData(["location": geo])
    }
    
}
