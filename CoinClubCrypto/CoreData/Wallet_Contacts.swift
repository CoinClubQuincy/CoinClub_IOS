////
////  Wallet_Contacts.swift
////  CoinClubCrypto
////
////  Created by Quincy Jones on 10/31/22.
////
//
//import Foundation
//import CoreData
//
//class coreDataViewModel: ObservableObject{
//    
//    let container: NSPersistentContainer
//    @Published var savedEntities: [FruitEntity] = []
//    
//    init(){
//        container = NSPersistentContainer(name: "CoreDataContainer")
//        container.loadPersistentStores {(description, error) in
//            if let error = error {
//                print("Error loading Core data: \(error)")
//            }
//        }
//        fecthFruits()
//    }
//    
//    func fecthFruits(){
//        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
//        do{
//            savedEntities = try container.viewContext.fetch(request)
//        } catch let error{
//            print("Error fetching content. \(error)")
//        }
//    }
//    
//    func addFruit(text:String){
//        let newFruit = FruitEntity(context: container.viewContext)
//        newFruit.name = text
//        saveData()
//    }
//    func saveData(){
//        do {
//            try container.viewContext.save()
//            fecthFruits()
//        } catch let error {
//            print("Error Saving. \(error)")
//        }
//    }
//    func deleteData(indexSet:IndexSet){
//        guard let index = indexSet.first else { return }
//        let entity = savedEntities[index]
//        container.viewContext.delete(entity)
//        saveData()
//    }
//    
//    func update(item: FruitEntity){
//        let currentName = item.name ?? ""
//        let newName = currentName + "!"
//        item.name = newName
//        saveData()
//    }
//    
//}
