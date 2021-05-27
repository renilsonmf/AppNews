//
//  TopicosViewController.swift
//  Noticias
//
//  Created by Renilson Moreira Ferreira on 26/05/21.
//

import UIKit

class TopicosViewController: UIViewController {
    
    let singleton: ConfiguracaoTopicos = ConfiguracaoTopicos.topicos
    var viewController: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewController = segue.destination as? ViewController
        if segue.identifier == "segueTecnologia"{
            viewController?.singleton.topicoSelecionado = singleton.topTec
        }
        else if segue.identifier == "segueEsportes"{
            viewController?.singleton.topicoSelecionado = singleton.topicoEsportes
        }
        else{
            viewController?.singleton.topicoSelecionado = singleton.topCien
        }
    }
    
 
    
}
