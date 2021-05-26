
import Foundation



struct Noticias: Codable {
    
    let articles: [Noticia]
    enum CodingKeys: String, CodingKey {
        case articles
    }
}

// MARK: - Article
struct Noticia: Codable {
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
