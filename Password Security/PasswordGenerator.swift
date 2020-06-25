//
//  PasswordGenerator.swift
//  Password Security
//
//  Created by Bruno Alves da Silva on 25/06/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import Foundation

class PasswordGenerator {
    
    //Propriedades da classe
    var numberOfCharacters: Int
    var userLetter: Bool
    var userNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacter: Bool
    
    //Criando um vetor
    var passwords: [String] = []
    
    //Criando constantes
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!#$%&'()*+,-./;:<=>?@[ˆ_`{"
    private let numbers = "0123456789"
    
    //Contrutor da clase
    init (numberOfCharacters: Int, userLetter: Bool, userNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacter: Bool) {
        
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
        
        self.numberOfCharacters = numchars
        self.userLetter = userLetter
        self.userNumbers = userNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacter = useSpecialCharacter
    }
    
    func generate(total: Int) -> [String] {
        
        //Limpando o array
        passwords.removeAll()
        
        var universe: String = ""
        
        if userLetter {
            universe += letters
        }
        
        if userNumbers {
            universe += numbers
        }
        
        if useSpecialCharacter {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        
        //Enquanto a quantidade de senhas for menor que quantidade foi passado
        while passwords.count < total {
            
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
}
