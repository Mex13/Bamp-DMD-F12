import Foundation
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var passwordSignUp: UITextField!
    @IBAction func signUpButton(_ sender: Any) {
 //this code allows the user to sign up to the app
        guard let email = emailSignUp.text, let password = passwordSignUp.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard (result?.user) != nil else { return }
   //if there is an error in signing up, this code wil return the user to the login page to try again
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! SelectionViewController
            self.present(vc, animated: true, completion: nil)
            
        }
        
        
        
        
    }
}
