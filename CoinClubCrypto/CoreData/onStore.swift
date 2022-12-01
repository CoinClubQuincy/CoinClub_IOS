//
//  onStore.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 11/29/22.
//

import SwiftUI
import CoreData

//struct XX: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Contacts_.name, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Contacts_>
//
//    @State var addContact: String = ""
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Contacts_.name, ascending: true)],
//        animation: .default)
//    private var names: FetchedResults<Contacts_>
//
//
//    var body: some View {
//        NavigationView {
//            VStack{
//                TextField("addd contact", text: $addContact)
//                    .font(.headline)
//                    .padding(.leading)
//                    .frame(height: 55)
//                    .background(Color.gray)
//                    .cornerRadius(10)
//                    .foregroundColor(.black)
//                    .padding(.horizontal)
//                List{
//                    ForEach(names) { item in
//                        NavigationLink {
//                            Text("Contact \(item.name!)")
//                        } label: {
//                            Text(item.name!)
//                        }
//                    }
//
//                }
//                Spacer()
//
//                Button(action: {
//                    guard !addContact.isEmpty else { return }
//                    addItem(name: addContact)
//                    //addProduct(name: addContact)
//                    addContact = ""
//                }, label: {
//                    Text("Add")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .frame(height: 55)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.green)
//                        .cornerRadius(10)
//                        .padding(.horizontal)
//                })
//            }
//            .navigationTitle("Contacts")
//            .toolbar {
//                ToolbarItem {
//                    Button(action: {
//                        addItem(name: addContact)
//                    }) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        }
//    }
//    private func addItem(name:String){
//        withAnimation {
//            let newItem = Contacts_(context: viewContext)
//            newItem.name = name
//            do {
//                try viewContext.save()
//
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//}





struct onStore: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()




























struct onStore_Previews: PreviewProvider {
    static var previews: some View {
        onStore()
    }
}
