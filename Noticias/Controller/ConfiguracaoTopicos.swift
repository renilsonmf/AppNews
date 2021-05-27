//
//  ConfiguracaoTopicos.swift
//  Noticias
//
//  Created by Renilson Moreira Ferreira on 27/05/21.
//

import UIKit

class ConfiguracaoTopicos {
    
    static let topicos = ConfiguracaoTopicos()
    var topTec = "https://newsapi.org/v2/everything?q=tecnologia&language=pt&apiKey="
    var topCien = "https://newsapi.org/v2/everything?q=ciencias&language=pt&apiKey="
    var topicoEsportes = "https://newsapi.org/v2/everything?q=esporte&language=pt&apiKey="
    var topicoSelecionado = ""
    
}
