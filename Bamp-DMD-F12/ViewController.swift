import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var tableView: UITableView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    locationManager.requestAlwaysAuthorization()
    locationManager.delegate = self
    locationManager.startUpdatingLocation()
    }
    
    
}

        
extension ViewController: CLLocationManagerDelegate {
    func didUpdate() {
        if tableView.numberOfRows(inSection: 0) = places.sport.count {
           tableView.reloadData()
        }
        if let indexPaths = tableView.indexPathsForVisibleRows {
            tableView.reloadRows(at: indexPaths, with: .fade)
        }
    }
    func locationManager( manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        places.setLocation(location)
    }
}
extension ViewController: UITableViewDataSource {
    func tableView( tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.sport.count
    }
    func tableView( tableView: UITableView, cellOfRowAt indexPath: IndexPath)
}
        

