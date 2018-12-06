
//
//
//
//




import UIKit

class SelectionViewControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var myImage: UIView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
