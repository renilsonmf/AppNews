
//  Created by Renilson Moreira Ferreira on 24/05/21.
//


import Foundation

class RequisicaoDeNoticias {
   
    var paginaSelecionada = 1
    
    func requisicaoApi(urlRequisicao: String) -> [NoticiaModel] {
       // let apiRequisicao = urlRequisicao
        let apiKey = ApiKey().chave
        let urlCompleta = "\(UrlPrincipal().urlInicio)\(urlRequisicao)\(UrlPrincipal().urlLinguagem)\(UrlPrincipal().pagina)\(paginaSelecionada)\(apiKey)"
        
        if let url = URL(string: urlCompleta)  {
            if let data = try? Data(contentsOf: url) {
                var noticiasModel: [NoticiaModel] = []
                let decoder = JSONDecoder()
                if let noticiasJson = try? decoder.decode(NoticiasModel.self, from: data) {
                    noticiasModel = noticiasJson.articles
                    paginaSelecionada += 1
                    print("PaginaSelecionada", paginaSelecionada)
                    return noticiasModel
                }

            }

        }
        
        return []

    }
    
}
