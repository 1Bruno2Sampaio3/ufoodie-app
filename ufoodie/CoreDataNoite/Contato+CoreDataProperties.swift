//
//  Contato+CoreDataProperties.swift
//  CoreDataNoite
//
//  Created by Francini Roberta de Carvalho on 6/1/16.
//  Copyright © 2016 Francini Carvalho. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contato {

    @NSManaged var nome: String?
    @NSManaged var email: String?

}
