import UIKit

class SelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let sports = ["Golf", "Tennis", "Cricket", "Skateboard"]
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sports.count
    }
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
    let sport = sports[indexPath.row]
    
    cell.sportImage.image = UIImage(named:  "\(sport).jpg")
    cell.myLabel.text = sport
    
    return cell
  }
        
    override func viewDidLoad() {
    super.viewDidLoad()
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 120.0
        
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
}

