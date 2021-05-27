//
//  TopicosViewController.swift
//  Noticias
//
//  Created by Renilson Moreira Ferreira on 26/05/21.
//

import UIKit

class TopicosViewController: UIViewController {
    
    let singleton: ConfiguracaoTopicos = ConfiguracaoTopicos.topicos
    var noticiasviewController: NoticiasViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        noticiasviewController = segue.destination as? NoticiasViewController
        if segue.identifier == "segueTecnologia"{
            noticiasviewController?.singleton.topicoSelecionado = singleton.topicoTecnologia
        }
        else if segue.identifier == "segueEsportes"{
            noticiasviewController?.singleton.topicoSelecionado = singleton.topicoEsportes
        }
        else if segue.identifier == "segueTurismo"{
            noticiasviewController?.singleton.topicoSelecionado = singleton.topicoTurismo
        }
        else{
            noticiasviewController?.singleton.topicoSelecionado = singleton.topicoCiencias
        }
    }
    
 
    
}
