//
//  ViewController.swift
//  Noticias
//
//  Created by Renilson Moreira Ferreira on 24/05/21.
//

import UIKit
import Alamofire
import AlamofireImage

class NoticiasViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    

    let singleton: ConfiguracaoTopicos = ConfiguracaoTopicos.topicos
    
    @IBOutlet weak var myCollection: UICollectionView!
    
    let requisicaoDeNoticias = RequisicaoDeNoticias()
    var listaNoticias: [Noticia] = []
    let topicosViewController = TopicosViewController()
    
    override func viewDidLoad() {
        myCollection.delegate = self
        myCollection.dataSource = self
        listaNoticias = requisicaoDeNoticias.makeRequest(urlRequisicao: singleton.topicoSelecionado)

    }
    // MARK: Numero de linhas
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaNoticias.count
    }
    // MARK: Conteudo Da Celula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaNoticia = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListaCollectionViewCell
        
        celulaNoticia.labelTitulo.text = listaNoticias[indexPath.row].title
      
        let urlImage = listaNoticias[indexPath.row].urlToImage
        if let image = URL(string: "\(urlImage)") {
            celulaNoticia.imagemNoticia.af_setImage(withURL: image)
        }
        celulaNoticia.labelDescricao.text = listaNoticias[indexPath.row].articleDescription
        celulaNoticia.layer.cornerRadius = 9
    

        return celulaNoticia
        
    }
    // MARK: Tamanho da Celula
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let alturaCelula = collectionView.bounds.height / 2
        let larguraCelula = collectionView.bounds.width / 1.05
        return CGSize(width: larguraCelula, height: alturaCelula)
    }
    //MARK: Pega o click do usuario e leva ele para a pagina
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let celulaNoticia = listaNoticias[indexPath.item]
        UIApplication.shared.openURL(URL(string: listaNoticias[indexPath.row].url)!)

    }

    
    
    }





