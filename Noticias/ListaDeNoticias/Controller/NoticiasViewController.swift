//
//  ViewController.swift
//  Noticias
//
//  Created by Renilson Moreira Ferreira on 24/05/21.
//

import UIKit
import Alamofire
import AlamofireImage

class NoticiasViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate{
        
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var myCollection: UICollectionView!
    
    let requisicaoDeNoticias = RequisicaoDeNoticias()
    var listaNoticias: [NoticiaModel] = []
    var dado = ["",""]
    var controlador = false
    
    override func viewDidLoad() {
        myCollection.delegate = self
        myCollection.dataSource = self
        carregarNovasNoticias()
        retornaTitulo()
    }
    //MARK: Carrega novas noticias
    func carregarNovasNoticias() {
        listaNoticias += requisicaoDeNoticias.requisicaoApi(urlRequisicao: dado[1] )
        myCollection.reloadData()
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
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let gatilho = contentHeight - scrollView.frame.height - 200
        
        if offsetY > gatilho{
            carregaMais()
        }
    }
    
    func carregaMais(){
        if !self.controlador{
            self.controlador = true
            DispatchQueue.main.async {
                sleep(1)
                print("CarregaMaisFunc")
                self.carregarNovasNoticias()
                self.controlador = false
            }
//            DispatchQueue.global().async {
//
//            }
        }
    }

    
    
    }





