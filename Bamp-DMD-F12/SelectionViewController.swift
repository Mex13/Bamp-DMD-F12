import UIKit
import Firebase

class SelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var sports = [SportType]()
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sports.count
    }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
    let sport = sports[indexPath.row]
    
    if let image = UIImage(named: sport.name) {
        cell.sportImage.image = image
    } else {
        cell.sportImage.image = UIImage(named: "SportSilhouette")
    }
    
    cell.myLabel.text = sport.name
    
    cell.contentView.backgroundColor = .red
    //cell.backgroundColor =
    

    
    
    return cell
  }
    
    
        
    override func viewDidLoad() {
    super.viewDidLoad()
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 120.0
        
        let ref = Firestore.firestore().collection("Sports")
        ref.getDocuments { snapshot, error in
            guard let snapshot = snapshot else { return }
            for document in snapshot.documents {
                let sportType = SportType(snapshot: document)
                self.sports.append(sportType)
            }
            self.tableView.reloadData()
        }
        

        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mapVC = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        self.present(mapVC, animated: true, completion: nil)
        

    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
}

