//
//  Event.swift
//  Prova2
//
//  Created by Mariarosa Savoldi on 21/03/18.
//  Copyright © 2018 Mariarosa Savoldi. All rights reserved.
//

import UIKit



class Event: NSObject {
    //MARK: Attributi
    
    var titolo: String?
    var descrizione: String?
    var tipologia: String?
    var luogo: String?
    var indirizzo: String?
    var inizio: String?
    var fine: String?
    var destinatari: String?
    var img_luogo: String?
    var img_tipo: String?
    
    init(titolo: String, descrizione: String, tipologia: String, luogo: String, indirizzo: String, inizio: String,
            fine: String, destinatari: String, img_luogo: String, img_tipo: String) {
        
        self.titolo = titolo
        self.descrizione = descrizione
        self.tipologia = tipologia
        self.luogo = luogo
        self.indirizzo = indirizzo
        self.inizio = inizio
        self.fine = fine
        self.destinatari = destinatari
        self.img_luogo = img_luogo
        self.img_tipo = img_tipo
    }
    override init() {
        self.titolo = ""
        self.descrizione = ""
        self.tipologia = ""
        self.luogo = ""
        self.indirizzo = "indirizzo"
        self.inizio = "inizio"
        self.fine = "fine"
        self.destinatari = ""
        self.img_luogo = ""
        self.img_tipo = "img_tipo"    }

}
