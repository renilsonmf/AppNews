
//  Created by Renilson Moreira Ferreira on 24/05/21.
//


import Foundation

class RequisicaoDeNoticias {
   
    func makeRequest(urlRequisicao: String) -> [NoticiaModel] {
        let apiRequisicao = urlRequisicao
        let apiKey = ApiKey().chave
        if let url = URL(string: (apiRequisicao)+apiKey)  {
            if let data = try? Data(contentsOf: url) {
                var news: [NoticiaModel] = []
                let decoder = JSONDecoder()
                if let newsJson = try? decoder.decode(NoticiasModel.self, from: data) {
                    news = newsJson.articles
                    return news
                }
            }
        }
        return []

    }
}
