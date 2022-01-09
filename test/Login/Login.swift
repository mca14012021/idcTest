//
//  Login.swift
//  test
//
//  Created by Lucky on 09/01/22.
//

import UIKit

class Login: UIViewController {
    
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var userNameErrormsg: UILabel!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var passwordErrormsg: UILabel!
    @IBOutlet weak var userNameTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTxtField.addTarget(self, action: #selector(textFieldChange(_:)), for: .editingChanged)
        passwordTxtField.addTarget(self, action: #selector(textFieldChange(_:)), for: .editingChanged)
    }
    @IBAction func submitAction(_ sender: Any) {
        if checkUserExist(userName:userNameTxtField.text!,password:passwordTxtField.text!){
            CoreDataStore.shared.storeUserData(userName:userNameTxtField.text! , password: passwordTxtField.text!)
            self.showToast(message: "Sucessfully Login!!")
            let vc = self.storyboard?.instantiateViewController(withIdentifier:"Home") as! Home
            self.navigationController?.pushViewController(vc, animated: true)
        }else {
            self.showToast(message:"Please check your credentials first")
        }
    }
    
    @objc func textFieldChange(_ sender: UITextField){
       
        if sender.tag == 101{
            if userNameTxtField.text!.isValid{
                userNameErrormsg.text = ""
            }else {
                userNameErrormsg.text = "Minimium 3 and Maximum 11 length character should be enter"
            }
            
        }
        if sender.tag == 102{
            if passwordTxtField.text!.isValid{
                passwordErrormsg.text = ""
            }else {
                passwordErrormsg.text = "Minimium 3 and Maximum 11 length character should be enter"
            }
        }
        if userNameTxtField.text!.isValid && passwordTxtField.text!.isValid{
            submitBtn.isUserInteractionEnabled = true
            submitBtn.backgroundColor = .black
        }else {
            submitBtn.isUserInteractionEnabled = false
            submitBtn.backgroundColor = .lightGray
        }
    }
}
