import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    let sport = SportPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sport.delegate = self
        sport.startPlaceSport()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager( manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        print(location)
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sport.sports.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let sportForCell = sport.sports[indexPath.row]
            cell.textLabel?.text = sportForCell.name
            cell.detailTextLabel?.text = sportForCell.type
            return cell
        }
        
        
//        func didUpdate() {
//            if tableView.numberOfRows(inSection: 0) = places.sport.count {
//                tableView.reloadData()
//            }
//            if let indexPaths = tableView.indexPathsForVisibleRows {
//                tableView.reloadRows(at: indexPaths, with: .fade)
//            }
//        }
    
}

extension ViewController: SportPlaceDelegate {
    func didUpdate() {
        tableView.reloadData()
    }
}
