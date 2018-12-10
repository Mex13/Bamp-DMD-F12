import Firebase

class SportType {
    
    let name: String
    
    init(snapshot: QueryDocumentSnapshot) {
        name = snapshot.data()["name"] as! String
    }
}
