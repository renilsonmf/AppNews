
//  Created by Renilson Moreira Ferreira on 24/05/21.
//


import Foundation

class RequisicaoDeNoticias {
   
    func requisicaoApi(urlRequisicao: String) -> [NoticiaModel] {
        let apiRequisicao = urlRequisicao
        let apiKey = ApiKey().chave
        if let url = URL(string: (apiRequisicao)+apiKey)  {
            if let data = try? Data(contentsOf: url) {
                var noticiasModel: [NoticiaModel] = []
                let decoder = JSONDecoder()
                if let noticiasJson = try? decoder.decode(NoticiasModel.self, from: data) {
                    noticiasModel = noticiasJson.articles
                    return noticiasModel
                }
            }
        }
        return []

    }
}
