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
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 120.0
    }
    
   
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager( manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        print(location)
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sport.sports.count
    }
        
   public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
            let sportForCell = sport.sports[indexPath.row]
            cell.textLabel?.text = sportForCell.name
    
            cell.imageView.image = sportForCell.TennisImage.image
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
