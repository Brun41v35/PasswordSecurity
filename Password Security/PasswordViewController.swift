//
//  PasswordViewController.swift
//  Password Security
//
//  Created by Bruno Alves da Silva on 24/06/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var tvPasswords: UITextView!
    
    //Criando variaveis para receber valores de outra tela
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var userLetter: Bool!
    var userNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacter: Bool!
    
    var passwordGenerator: PasswordGenerator!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, userLetter: userLetter, userNumbers: userNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacter: useSpecialCharacter)
        
        generatePassword()
        
    }
    
    func generatePassword() {
        
        //Colocando o Scroll no inicio
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: Any) {
        generatePassword()
    }
}
