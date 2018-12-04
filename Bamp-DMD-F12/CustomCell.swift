import UIKit

class CustomCell: UITableViewCell {
   
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    cell.myLabel.text = "Row \(indexPath.row)"
    
    
    override func prepareForReuse() {
        super.prepadeForReuse()
   }
}
