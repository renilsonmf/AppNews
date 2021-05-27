//
//  TopicosViewController.swift
//  Noticias
//
//  Created by Renilson Moreira Ferreira on 26/05/21.
//

import UIKit

class TopicosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //indentificador: cellCategoria
    
    let singleton: ConfiguracaoTopicos = ConfiguracaoTopicos.topicos
    var noticiasviewController: NoticiasViewController?
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return singleton.listaCategorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaCategoria = tableView.dequeueReusableCell(withIdentifier: "cellCategoria", for: indexPath) as! ListaCategoriaTableViewCell
        celulaCategoria.labelNomeCategoria.text = singleton.listaCategorias[indexPath.row][0]
        return celulaCategoria
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.myTableView.deselectRow(at: indexPath, animated: true)
        noticiasviewController?.dado = singleton.listaCategorias[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        noticiasviewController = segue.destination as? NoticiasViewController
        
        //if segue.identifier == "segueCategoria"{
        //    noticiasviewController?.singleton.topicoSelecionado = singleton.topicoTecnologia
      //  }
        
            
        }
        
        
    
   // }
    
    
    
    
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        noticiasviewController = segue.destination as? NoticiasViewController
//        if segue.identifier == "segueTecnologia"{
//            noticiasviewController?.singleton.topicoSelecionado = singleton.topicoTecnologia
//        }
//        else if segue.identifier == "segueEsportes"{
//            noticiasviewController?.singleton.topicoSelecionado = singleton.topicoEsportes
//        }
//        else if segue.identifier == "segueTurismo"{
//            noticiasviewController?.singleton.topicoSelecionado = singleton.topicoTurismo
//        }
//        else{
//            noticiasviewController?.singleton.topicoSelecionado = singleton.topicoCiencias
//        }
//    }
    
 
    
}
