import UIKit

class AppContainerViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            self.setTitleDisplay(user)
//            self.tableView.reloadData()
            AppManager.shared.appContainer = self
        AppManager.shared.showApp()
    
            
    }
}
