
import Foundation



struct NoticiasModel: Codable {
    
    let articles: [NoticiaModel]
    enum CodingKeys: String, CodingKey {
        case articles
    }
}

// MARK: - Article
struct NoticiaModel: Codable {
  //  let author: String
    let title: String?
    let articleDescription: String
    let url: String
    let urlToImage: String
//    let publishedAt: Date
//    let content: String

    enum CodingKeys: String, CodingKey {
   //     case author
        case title
        case articleDescription = "description"
        case url
        case urlToImage
//      case publishedAt, content
    }
}
struct UrlPrincipal {
    let urlInicio = "https://newsapi.org/v2/everything?q="
    let urlLinguagem = "&language=pt"
    let pagina = "&page="
}
