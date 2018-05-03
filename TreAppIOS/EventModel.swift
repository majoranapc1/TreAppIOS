//
//  EventModel.swift
//  Prova2
//
//  Created by Mariarosa Savoldi on 05/04/18.
//  Copyright © 2018 Mariarosa Savoldi. All rights reserved.
//

import Foundation

protocol EventModelProtocol: class  {
    func itemsDownloaded(items: NSArray)
}
/*protocol BiblioModelProtocol: class  {
    func bibioDownloaded(biblios: NSArray)
}
*/
class EventModel: NSObject, URLSessionDataDelegate {
    /*
    func conServer() -> String {
        let url = URL(string: "http://www.majorapp.it/treapp/eventi.php?biblio=10")
        let urlPath = URLRequest(url: url!)
        var responses: String = "testttt"
        
        URLSession.shared.dataTask(with: urlPath as URLRequest) { (data, response, error) in
            if error != nil{
                print(error!)
            }
            else{
                //print(responses)
                responses = String(data: data!, encoding: .utf8)!
            }
        }.resume()
        return responses
    }
     */
    
    //properties
    weak var delegate: EventModelProtocol!
    
    var data = Data()
    var returnData: String = "zdgjfkssfkfh"
    
    let urlPath: String = "http://www.majorapp.it/treapp/eventi.php?biblio=10" //serve il path di dove si trova il service.php
    
    func downloadItems(link: String, type: String){
        let url: URL = URL(string: link)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url){
            (data,responde,error) in
            
            if error != nil {
                print("Failed to download data")
            }else{
                print("Data Dowloaded")
                self.returnData = String(data: data!, encoding: .utf8)! //"testiamo almeno"
                //print("returnData: ", self.returnData + " Data: ", self.data)
                //let evento = Event(test: self.returnData)
                var stringhe = NSMutableArray()
                if(type == "Event"){
                    stringhe = self.stringToEvents(s: self.returnData)
                    //self.delegate.itemsDownloaded(items: stringhe)
                }
                else if (type == "Biblio"){
                    stringhe = self.stringToBiblios(s: self.returnData)
                    //self.delegate.biblioDownloaded(biblios: stringhe)
                }
                 self.delegate.itemsDownloaded(items: stringhe)
                //stringhe.add(self.data)
                //stringhe.add(evento)
                print(stringhe.count)

                //self.parseJSON(data!)
            }
        }
        task.resume()
    }
 func stringToEvents(s: String)-> NSMutableArray {
        let temp = NSMutableArray()
        var first: Bool = true;
        var array = s.split(separator: ";",maxSplits: 999999999999)
        var j=0
        var x = 1
        var evento = Event()
    
        while j<array.count {
           // print(String(array[j]))
           // print("      prossimo        j:" + String(j) + "    ")
            switch(x) {
            case 1:
                if(first){
                    evento.titolo = String(array[j])
                }
                else{   /* Elimina il carattere "\n" dalle stringhe relative agli eventi dopo il primo*/
                    evento.titolo = String(String(array[j]).dropFirst())
                   // print(evento.titolo! + "    ")
                }
                    //print(String(array[j]),"  ", evento.titolo)
            case 2:
                    evento.descrizione = String(array[j])
                   // print(String(array[j]), "   ", evento.descrizione)
            case 3:
                    evento.tipologia = String(array[j])
            case 4:
                    evento.luogo = String(array[j])
            case 5:
                    evento.indirizzo = String(array[j])
            case 6:
                    evento.inizio = String(array[j])
            case 7:
                    evento.fine = String(array[j])
            case 8:
                    evento.destinatari = String(array[j])
            case 9:
                    evento.img_luogo = String(array[j])
            case 10:
                    evento.img_tipo = String(array[j])
                    x = 0
                    first = false;
                    temp.add(evento)
                    evento = Event()
            default: break
            }
            x = x + 1
            j = j + 1
            //if(s[i]==";")
        }
        return temp
    }
    
    func stringToBiblios(s: String)-> NSMutableArray{
        let temp = NSMutableArray()
        var first: Bool = true;
        var array = s.split(separator: ";",maxSplits: 999999999999)
        var j=0
        var x = 1
        var biblio = Cella()
        
        while j<array.count {
            // print(String(array[j]))
            // print("      prossimo        j:" + String(j) + "    ")
            switch(x) {
            case 1:
                if(first){
                    biblio.id = Int(array[j])!
                }
                else{   /* Elimina il carattere "\n" dalle stringhe relative agli eventi dopo il primo*/
                    biblio.id = Int(String(array[j]).dropFirst())!
                    // print(evento.titolo! + "    ")
                }
            //print(String(array[j]),"  ", evento.titolo)
            case 2:
                biblio.nome = String(array[j])
            // print(String(array[j]), "   ", evento.descrizione)
            case 3:
                biblio.paese = String(array[j])
            case 4:
                biblio.sito = String(array[j])
                x = 0
                first = false;
                temp.add(biblio)
                biblio = Cella()
            default: break
            }
            x = x + 1
            j = j + 1
            //if(s[i]==";")
        }
        return temp
    }
}
