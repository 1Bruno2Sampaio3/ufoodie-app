//
//  ViewController.swift
//  CoreDataNoite
//
//  Created by Francini Roberta de Carvalho on 6/1/16.
//  Copyright © 2016 Francini Carvalho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var indexAlterar: UITextField!
    @IBOutlet weak var nomeAlterar: UITextField!
    
    @IBOutlet weak var indexExcluir: UITextField!
    
    // array de "Contato" que utilizaremos nas operações
    var listaContatos: [Contato] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //teste
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func salvar(sender: AnyObject) {
        // criação e inicialização do objeto, para que ele possa receber valores
        let contato: Contato = Contato()
        contato.nome = self.nomeTextField.text
        contato.email = self.emailTextField.text
        
        // chamada do método de inserir, que está no "M" (model) do MVC
        ContatoDAO.inserir(contato)
    }
    
    @IBAction func buscarTodos(sender: AnyObject) {
        // preenchendo o array com todos os contatos existentes no banco
        self.listaContatos = ContatoDAO.buscarTodos()
        
        // iteração no array para imprimir no console tudo que veio do banco
        for item in listaContatos {
            print(item.nome!)
            print(item.email!)
        }
    }
    
    @IBAction func alterar(sender: AnyObject) {
        // preenchendo o array para pegar dele o objeto que queremos alterar
        self.listaContatos = ContatoDAO.buscarTodos()
        
        // obtendo o index informado pelo usuário, através dele selecionaremos o objeto que será alterado
        let indexContato = Int(self.indexAlterar.text!)
        // obtendo o objeto pelo seu index
        let contato = self.listaContatos[indexContato!]
        
        contato.nome = self.nomeAlterar.text
        
        // chamada do método para alterar o contato
        ContatoDAO.alterar()
    }
    
    @IBAction func excluir(sender: AnyObject) {
        // preenchendo o array para pegar dele o objeto que queremos alterar
        self.listaContatos = ContatoDAO.buscarTodos()
        
        // obtendo o index informado pelo usuário, através dele selecionaremos o objeto que será excluído
        let indexContato = Int(self.indexExcluir.text!)
        let contato = self.listaContatos[indexContato!]
        
        // chamado do método de exclusão, passando para ele o contato que deve ser excluído
        ContatoDAO.deletar(contato)
    }
    

}

