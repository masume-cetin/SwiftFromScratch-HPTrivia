//
//  Store.swift
//  HPTrivia
//
//  Created by masume çetin on 19.08.2025.
//

import StoreKit


@MainActor
@Observable
class Store {
    var products : [Product] = []
    var purchased  = Set<String>()
    private var updates : Task<Void,Never>? = nil
    
    // Load available producys
    func loadProducts() async{
        do {
            products = try await Product.products(for: ["hp4","hp5","hp6","hp7"])
            products.sort {
                $0.displayName < $1.displayName
            }
        }catch {
            print("Unable to load products \(error)")
        }
    }
    // purchase a product
    
    // check for purchased products
    
    // connect with app store to watch for purchase and transaction updates
}
