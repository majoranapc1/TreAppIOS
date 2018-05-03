//
//  Cella.swift
//  Prova2
//
//  Created by Mariarosa Savoldi on 09/04/18.
//  Copyright © 2018 Mariarosa Savoldi. All rights reserved.
//

import Foundation
import UIKit

class Cella: NSObject{
    
    var paese: String = ""
    var nome: String = ""
    var sito: String = ""
    var id = 0
    
    init(id: Int, nome: String, paese: String, sito: String){
        self.id = id
        self.nome = nome
        self.paese = paese
        self.sito = sito
    }
    override init(){
        id = 0
        nome = ""
        paese = ""
        sito = ""
    }
}
