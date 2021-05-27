//
//  TopicosViewController.swift
//  Noticias
//
//  Created by Renilson Moreira Ferreira on 26/05/21.
//

import UIKit

class TopicosViewController: UIViewController {
    
    let singleton: ConfiguracaoTopicos = ConfiguracaoTopicos.topicos
    var viewController: NoticiasViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewController = segue.destination as? NoticiasViewController
        if segue.identifier == "segueTecnologia"{
            viewController?.singleton.topicoSelecionado = singleton.topicoTecnologia
        }
        else if segue.identifier == "segueEsportes"{
            viewController?.singleton.topicoSelecionado = singleton.topicoEsportes
        }
        else if segue.identifier == "segueTurismo"{
            viewController?.singleton.topicoSelecionado = singleton.topicoTurismo
        }
        else{
            viewController?.singleton.topicoSelecionado = singleton.topicoCiencias
        }
    }
    
 
    
}
