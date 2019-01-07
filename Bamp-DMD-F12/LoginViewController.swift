import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    //these are the text fields where the user enters their details (email and pw)
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    @IBAction func login(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let _ = result?.user {
                self.dismiss(animated: true, completion: nil)
//This bit of code means that if the user has entered the correct email and password then the login screen will` dismiss
            }

        }
    
    }
    @IBAction func logout(_ sender: Any) {
        AppManager.shared.logout()
    }
}
