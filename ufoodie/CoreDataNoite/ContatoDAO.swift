//
//  ContatoDAO.swift
//  CoreDataNoite
//
//  Created by Francini Roberta de Carvalho on 6/1/16.
//  Copyright © 2016 Francini Carvalho. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ContatoDAO {
    
    // utilizaremos o "static" nestes métodos para poder chamá-los diretamente, sem necessidade de instantciar a classe ContatoDAO
    static func inserir(contato: Contato) {
        
        // em 2 passos, estamos buscando o objeto managedObjectContext
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // preparando o banco para inserir um novo objeto
        context.insertObject(contato)
        
        do {
            // confirmando a inclusão do novo objeto no banco
            // para o CoreData, qualquer alteração que seja feita no banco pode ser confirmada com o método save()
            try context.save()
            print("Salvooooou o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func alterar() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        do {
            // estamos trabalhando com contexto, então, ao alterar um objeto que foi buscado anteriormente no banco, não precisamos especificar o objeto para salvar
            try context.save()
            print("Alterooou o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }
    
    static func deletar(contato: Contato) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // informar que a operação é um "delete"
        context.deleteObject(contato)
        
        do {
            try context.save()
            print("Deletou o/")
            
        } catch let erro as NSError {
            print(erro)
        }
    }

    
    static func buscarTodos() -> [Contato] {
        // obtendo AppDelegate onde esta a Core Data stack
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // obtendo o context, que utilizaremos sempre que realizarmos operações com banco
        let context = appDelegate.managedObjectContext
        
        // lista de contatos que será retornada pelo método
        var contatos: [Contato] = []
        
        // cria a busca que faremos no banco, informando nome da tabela
        let request: NSFetchRequest = NSFetchRequest(entityName: "Contato")
        // informa por quais campos o resultado será ordenado, e se será em ordem crescente ou decrescente
        request.sortDescriptors = [NSSortDescriptor(key: "nome", ascending: true)]
        
        // para definir critério de busca (cláusula "where"), utilize NSPredicate
        
        do {
            // obtendo contatos do banco e preenchendo o array de Contato
            contatos = try context.executeFetchRequest(request) as! [Contato]
            print("Total de contatos: ", contatos.count)
            
        } catch let erro as NSError {
            print(erro)
        }
        
        
        return contatos
    }
    
}
