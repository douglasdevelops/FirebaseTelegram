import UIKit
import FirebaseAuth
import SVProgressHUD


class RegisterViewController: UIViewController {

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func registerPressed(_ sender: AnyObject) {
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("User Registered")
                SVProgressHUD.dismiss()
                
                self.passwordTextfield.text = ""
                self.emailTextfield.text = ""
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
}
