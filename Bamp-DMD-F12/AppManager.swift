import UIKit
import Firebase

class AppManager {
    
    static let shared = AppManager()
    
    let storyboard = UIStoryboard (name: "Main", bundle: nil)
    
    var appContainer: AppContainerViewController!
    
    
    private init () {}
    
    func showApp(){
        
        var viewController: UIViewController
        if Auth.auth().currentUser == nil{
            viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            
            //This code will work once Firebase is attached to our project :) x
        } else {
           
            viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        }
        
    appContainer.present(viewController, animated: true, completion: nil)
        
    }
    
}
