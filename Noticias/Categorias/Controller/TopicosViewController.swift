//
//  TopicosViewController.swift
//  Noticias
//
//  Created by Renilson Moreira Ferreira on 26/05/21.
//

import UIKit

class TopicosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    let categorias: ConfiguracaoTopicos = ConfiguracaoTopicos.topicos
    var noticiasviewController: NoticiasViewController?
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    // MARK: Retorna a quantidade de celulas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorias.listaCategorias.count
    }
    
    //MARK: Conteudo da celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaCategoria = tableView.dequeueReusableCell(withIdentifier: "cellCategoria", for: indexPath) as! ListaCategoriaTableViewCell
        celulaCategoria.labelNomeCategoria.text = categorias.listaCategorias[indexPath.row][0]
        return celulaCategoria
    }
    
    //MARK: Altura da celula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
        
    }
    
    //MARK: Clique do usuario na celula
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.myTableView.deselectRow(at: indexPath, animated: true)
        noticiasviewController?.dado = categorias.listaCategorias[indexPath.row]
    }
    
    //MARK: Direciona o usuario para tela de noticias
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        noticiasviewController = segue.destination as? NoticiasViewController
     
        }
        
    
}
