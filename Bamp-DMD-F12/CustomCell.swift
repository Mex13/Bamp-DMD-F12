import UIKit

class CustomCell: UITableViewCell {
<<<<<<< HEAD
   

    @IBOutlet weak var myLabel: UILabel!


    cell.myLabel.text = "Row \(indexPath.row)"
    

=======
    
    var sports: Sport?
   
    @IBOutlet weak var myLabel: UILabel!
<<<<<<< HEAD
    @IBOutlet weak var sportImage: UIImageView!

=======
    
    
    cell.myLabel.text = "Row \(indexPath.row)"
    
    
>>>>>>> d016f1b43766fcb7ca65993acfd31eef4b05f070
>>>>>>> 658231cb388df6e863cf1bb25e22d734693f26e6
    override func prepareForReuse() {
        super.prepadeForReuse()
   }
}
