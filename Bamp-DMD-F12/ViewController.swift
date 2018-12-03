import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let locationManager = CLLocationManager()
    let sport = SportPlaces(name: "Football")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sport.delegate = self
        sport.startPlacesSports()
        
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
        func tableView( tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return places.sport.count
        }
        
        func tableView( tableView: UITableView, cellOfRowAt indexPath: IndexPath) -> UITableViewCell {
          
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell"), `for`: IndexPath;)
            let SportForCell = places.sport[IndexPath.row]
            cell?.textLabel?.text = SportForCell.name
            cell.detailTextLabel?;text = " \(sportForCell.location.latitude) - \
            (SportForCell.location.longitude)"
            return cell
        }
        
        
        func didUpdate() {
            if tableView.numberOfRows(inSection: 0) = places.sport.count {
                tableView.reloadData()
            }
            if let indexPaths = tableView.indexPathsForVisibleRows {
                tableView.reloadRows(at: indexPaths, with: .fade)
            }
        }
        
        func tableView ( tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: <#T##IndexPath#>, animated: true)
            tableView.reloadRows (at: IndexPath, with: .fade)
        }
}
extension ViewController: CLLocationManagerDelegate {
            
            func locationManager ( manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                guard let location = locations.last else {return}
                
                
            }
}



