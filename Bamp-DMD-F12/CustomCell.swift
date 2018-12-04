import UIKit

class CustomCell: UITableViewCell {
    
    var sports: Sport?
   
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var sportImage: UIImageView!

    override func prepareForReuse() {
        super.prepadeForReuse()
    }
}
