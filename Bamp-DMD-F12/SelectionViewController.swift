import UIKit

class SelectionViewController: UISelectionViewController, UITableViewDataSource, UITableViewDelegate {
    
    let sports = ["Golf", "Tennis", "Cricket", "Skateboard"]
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    return (sports.count)
  
    
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
   {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SelectionViewControllerTableViewCell
    
    CellOne.myImage.image = UIImage(named: sports[indexPath.row]+, ".jpg")
    CellOne.myLabel.text = sports[indexPath.row]
    
    return (CellOne)
        }
    override func viewDidLoad() {
    super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    }
}
}
