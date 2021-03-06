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
        
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var myCollection: UICollectionView!
    
    let requisicaoDeNoticias = RequisicaoDeNoticias()
    var listaNoticias: [NoticiaModel] = []
    var dado = ["",""]
    
    override func viewDidLoad() {
        myCollection.delegate = self
        myCollection.dataSource = self
    
        listaNoticias = requisicaoDeNoticias.requisicaoApi(urlRequisicao: dado[1] )
        
        retornaTitulo()
    }
    
    // MARK: Muda o titulo da categoria de acordo com a categoria selecionada
    func retornaTitulo(){
        labelTitulo.text = dado[0]
    }
    
    
    // MARK: Numero de linhas
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaNoticias.count
    }
    // MARK: Conteudo Da Celula
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaNoticia = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListaCollectionViewCell
        
        let urlImage = listaNoticias[indexPath.row].urlToImage
        
        if let image = URL(string: "\(urlImage)") {
            celulaNoticia.imagemNoticia.af_setImage(withURL: image)
        }
        
        celulaNoticia.labelTitulo.text = listaNoticias[indexPath.row].title
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
        UIApplication.shared.openURL(URL(string: listaNoticias[indexPath.row].url)!)
    }

    
    
    }





