import UIKit
import FirebaseAuth
import SVProgressHUD


class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func logInPressed(_ sender: AnyObject) {

        SVProgressHUD.show()
        
        if let userEnteredEmail = emailTextfield.text, let userEnteredPassword = passwordTextfield.text {
            Auth.auth().signIn(withEmail: userEnteredEmail, password: userEnteredPassword) { (user, error) in
                if error != nil {
                    print(error!)
                } else {
                    SVProgressHUD.dismiss()
                    
                    self.emailTextfield.text = ""
                    self.passwordTextfield.text = ""
                    
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
            }
        }
    }
}  
