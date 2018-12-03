import Firebase
import CoreLocation

protocol SportPlaceDelegate {
    func didUpdate()
}

class SportPlaces {
    
    var delegate: SportPlaceDelegate?
    var sports = [Sport]()
    
    init () {

    }
    
    func startPlaceSport() {
        let ref = Firestore.firestore().collection("locations")
    
        ref.getDocuments { snapshot, error in
    
            guard let snapshot = snapshot else { return }
            self.sports.removeAll()
            for document in snapshot.documents {
                if let sport = Sport(snapshot: document) {
                    self.sports.append(sport)
                }
                self.delegate?.didUpdate()
            }
            
        }
        
    }
    
    
}
