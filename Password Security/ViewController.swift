//
//  ViewController.swift
//  Password Security
//
//  Created by Bruno Alves da Silva on 24/06/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfNumberCharacter: UITextField!
    @IBOutlet weak var tfTotalPassword: UITextField!
    @IBOutlet weak var swSpecialCharacter: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swLetters: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Passando informacoes para outra view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let password = segue.destination as! PasswordViewController
        if let numbersOfPasswords = Int(tfTotalPassword.text!) {
            password.numberOfPasswords = numbersOfPasswords
        }
        if let numbersOfCharacters = Int(tfNumberCharacter.text!) {
            password.numberOfCharacters = numbersOfCharacters
        }
        password.useSpecialCharacter = swSpecialCharacter.isOn
        password.useCapitalLetters = swCapitalLetters.isOn
        password.userNumbers = swNumbers.isOn
        password.userLetter = swLetters.isOn
        
        // perde o foco e o teclado desaparece
        view.endEditing(true)
    }
}

