import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.text = "test@test.com"
        passwordTextField.text = "password"
    }
    
    @IBAction func login(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }

        
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let user = result?.user else { return }
        }
        
        
        
        
        
        

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let _ = result?.user {
                self.dismiss(animated: true, completion: nil)
                
            }

        }
    
    }
}
