//
//  LoginViewController.swift
//  ESG-ZenGrove
//
//  Created by De Azevedo Santos, Guilherme on 15/03/24.
//

import UIKit

class LoginViewController: UIViewController {
    
  
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private enum PageType {
        case login
        case signUp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalPresentationStyle = .fullScreen

    
    }
    
    private var currentPageType: PageType = .login {
        didSet{
            setupViewsFor(pageType: currentPageType)
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupViewsFor(pageType: .login)
    }
    
    private func setupViewsFor(pageType: PageType){
        confirmPasswordTextField.isHidden = pageType == .login
       
        forgetPasswordButton.isHidden = pageType == .signUp
        loginButton.isHidden = pageType == .signUp
        
    }

        
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        
        if(currentPageType == .login){
            setupViewsFor(pageType:.signUp)
            
            segmentedControl.selectedSegmentIndex = 1
        }else {
            if let email = emailTextField.text, !email.isEmpty,
               let password = passwordTextField.text, !password.isEmpty,
               let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty {
                // Se os campos estiverem preenchidos, verifica se a senha e a confirmação de senha coincidem
                if password == confirmPassword {
                    // Se a senha e a confirmação de senha coincidirem, segue para a próxima página
                    performSegue(withIdentifier: "mainPage", sender: nil)
                } else {
                    // Se a senha e a confirmação de senha não coincidirem, exibe uma mensagem de erro ao usuário
                    let alertController = UIAlertController(title: "Erro", message: "A senha e a confirmação de senha não coincidem.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(okAction)
                    present(alertController, animated: true, completion: nil)
                }
            } else {
                // Se algum campo estiver vazio, exibe uma mensagem de erro ao usuário
                let alertController = UIAlertController(title: "Erro", message: "Por favor, preencha todos os campos.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
        }
        // Verifica se os campos de e-mail, senha e confirmação de senha não estão vazios
   
    }
    
   
    @IBAction func loginButtonTapped(_ sender: Any) {
      
        if let email = emailTextField.text, !email.isEmpty,
           let password = passwordTextField.text, !password.isEmpty {
            
            performSegue(withIdentifier: "mainPage", sender: nil)
        } else {
            // Se algum campo estiver vazio, exibe uma mensagem de erro ao usuário
            let alertController = UIAlertController(title: "Erro", message: "Por favor, preencha todos os campos.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    

    
  
    @IBAction func segmetedControlChange(_ sender: UISegmentedControl){
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
        
       
    }
}
