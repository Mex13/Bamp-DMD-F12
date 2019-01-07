import Foundation
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var passwordSignUp: UITextField!
    @IBAction func signUpButton(_ sender: Any) {
        
        guard let email = emailSignUp.text, let password = passwordSignUp.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard (result?.user) != nil else { return }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! SelectionViewController
            self.present(vc, animated: true, completion: nil)
            
        }
        
        
        
        
    }
}
