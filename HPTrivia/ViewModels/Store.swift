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
    func purchase (_ product: Product) async{
        do{
            let result = try await product.purchase()
            
            switch result {
            case .success(let verificationResult):
                // purchase succesfull but now we need to verify receipt and transaction
                switch verificationResult {
                case .unverified(let signedType, let verificationError):
                    print("error on \(signedType) : \(verificationError)")
                case .verified(let signedType):
                    purchased.insert(signedType.productID)
                    
                    await signedType.finish()
                }
            case .userCancelled:
                // user canceled or parent disapproved child's purchase request
                break
            case .pending:
                // waiting for some sort of approval
                break
           @unknown default :
                break
            }
        }
        catch{
            print("Unable to purchase product \(error)")
        }
    }
    // check for purchased products
    
    // connect with app store to watch for purchase and transaction updates
}
