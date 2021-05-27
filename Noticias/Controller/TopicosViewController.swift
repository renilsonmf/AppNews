//
//  TopicosViewController.swift
//  Noticias
//
//  Created by Renilson Moreira Ferreira on 26/05/21.
//

import UIKit

//var testeGeral = ""


class TopicosViewController: UIViewController {
    
    let singleton: ConfiguracaoTopicos = ConfiguracaoTopicos.topicos
    
    //var topico: String = "" //"https://newsapi.org/v2/everything?q=tecnologia&language=pt&apiKey="

    //func retornaTopico() -> String{
     //   return singleton.testeGeral
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonUrlTecnologia(_ sender: Any) {
       // let tec = singleton.topicoTec
        singleton.topicoSelecionado = singleton.topTec
        //var topicoTecnologia =  "https://newsapi.org/v2/everything?q=tecnologia&language=pt&apiKey="
        //singleton = topicoTecnologia
       // print("TECNOLOGIA\(singleton)")
       self.performSegue(withIdentifier: "topico", sender: nil)
     
    }
    
    @IBAction func buttonUrlCiencias(_ sender: Any) {
       // let ciencias = singleton.topicoCiencias
        singleton.topicoSelecionado = singleton.topCien
       // let topicoCiencias =  "https://newsapi.org/v2/everything?q=ciencias&language=pt&apiKey="
      //  topico = topicoCiencias
            //print("CIENCIAS\(topico)")
        self.performSegue(withIdentifier: "topico", sender: nil)
       
    }
    
}
