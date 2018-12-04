import UIKit

class CustomCell: UITableViewCell {
    
    var sports: Sport?
   
    @IBOutlet weak var myLabel: UILabel!
<<<<<<< HEAD
    @IBOutlet weak var sportImage: UIImageView!

=======
    
    
    cell.myLabel.text = "Row \(indexPath.row)"
    
    
>>>>>>> d016f1b43766fcb7ca65993acfd31eef4b05f070
    override func prepareForReuse() {
        super.prepadeForReuse()
   }
}
