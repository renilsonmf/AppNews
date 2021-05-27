//
//  ConfiguracaoTopicos.swift
//  Noticias
//
//  Created by Renilson Moreira Ferreira on 27/05/21.
//

import UIKit

class ConfiguracaoTopicos {
    
    static let topicos = ConfiguracaoTopicos()
    let topicoTecnologia = "https://newsapi.org/v2/everything?q=tecnologia&language=pt&apiKey="
    let topicoCiencias = "https://newsapi.org/v2/everything?q=ciencias&language=pt&apiKey="
    let topicoEsportes = "https://newsapi.org/v2/everything?q=esporte&language=pt&apiKey="
    let topicoTurismo = "https://newsapi.org/v2/everything?q=turismo&language=pt&apiKey="
    var topicoSelecionado = ""
    
}
