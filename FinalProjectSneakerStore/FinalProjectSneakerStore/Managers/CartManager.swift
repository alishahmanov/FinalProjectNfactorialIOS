import SwiftUI
import FirebaseFirestore
import FirebaseAuth

enum CartAction {
    case add
    case remove
}

@MainActor
class CartManager: ObservableObject {
    @Published var cartItems: [Sneaker] = []
    private let db = Firestore.firestore()

    func addToCart(item: Sneaker) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let userCartRef = db.collection("users").document(userId).collection("cart").document(item.id ?? UUID().uuidString)

        userCartRef.getDocument { (document, error) in
            if let document = document, document.exists {
                userCartRef.updateData(["numberInCart": FieldValue.increment(Int64(1))])
            } else {
                let newItem = Sneaker(
                    id: item.id ?? UUID().uuidString,
                    name: item.name,
                    description: item.description,
                    price: item.price,
                    inCart: true,
                    photoID: item.photoID,
                    numberInCart: item.numberInCart
                )

                do {
                    try userCartRef.setData(from: newItem)
                } catch {
                    print("Ошибка добавления в корзину: \(error.localizedDescription)")
                }
            }
        }
    }

    func fetchCart() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        db.collection("users").document(userId).collection("cart")
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("Ошибка загрузки корзины: \(error.localizedDescription)")
                    return
                }
                
                self.cartItems = snapshot?.documents.compactMap { document in
                    try? document.data(as: Sneaker.self)
                } ?? []
            }
    }
    
    func incrementNumberInCart(for sneaker: Sneaker) {
        guard let userId = Auth.auth().currentUser?.uid, let sneakerId = sneaker.id else { return }
        
        let userCartRef = Firestore.firestore()
            .collection("users")
            .document(userId)
            .collection("cart")
            .document(sneakerId)

        userCartRef.updateData([
            "numberInCart": FieldValue.increment(Int64(1))
        ]) { error in
            if let error = error {
                print("Ошибка увеличения количества: \(error.localizedDescription)")
            } else {
                print("numberInCart` увеличено для \(sneaker.name)")
                self.fetchCart()
            }
        }
    }

    
    func decrementNumberInCart(for sneaker: Sneaker) {
        guard let userId = Auth.auth().currentUser?.uid, let sneakerId = sneaker.id else { return }
        
        let userCartRef = Firestore.firestore()
            .collection("users")
            .document(userId)
            .collection("cart")
            .document(sneakerId)

        userCartRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let data = document.data(), let currentCount = data["numberInCart"] as? Int {
                    if currentCount > 1 {
                        userCartRef.updateData([
                            "numberInCart": FieldValue.increment(Int64(-1))
                        ]) { error in
                            if let error = error {
                                print("Ошибка уменьшения количества: \(error.localizedDescription)")
                            } else {
                                print("numberInCart` уменьшено для \(sneaker.name)")
                                self.fetchCart()
                            }
                        }
                    } else {
                        
                        userCartRef.delete { error in
                            if let error = error {
                                print("\(error.localizedDescription)")
                            } else {
                                DispatchQueue.main.async {
                                    self.cartItems.removeAll { $0.id == sneaker.id }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    
    func deleteSneakerFromCart(_ sneaker: Sneaker) async throws {
        guard let userID = Auth.auth().currentUser?.uid else {
            throw NSError(domain: "Authentication", code: 401, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        guard let sneakerID = sneaker.id else {
            throw NSError(domain: "Firestore", code: 404, userInfo: [NSLocalizedDescriptionKey: "Sneaker ID not found"])
        }
        
        let sneakerRef = Firestore.firestore()
            .collection("users")
            .document(userID)
            .collection("cart")
            .document(sneakerID)
        
        try await sneakerRef.delete()
        
        print("\(sneaker.name) удален")
    }



    
    func toggleCartItem(item: Sneaker, action: CartAction) {
        guard let userId = Auth.auth().currentUser?.uid, let itemId = item.id else { return }
        let userCartRef = db.collection("users").document(userId).collection("cart").document(itemId)

        userCartRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let data = document.data(), let currentCount = data["numberInCart"] as? Int {
                    switch action {
                    case .add:
                        userCartRef.updateData(["numberInCart": FieldValue.increment(Int64(1))])
                    case .remove:
                        if currentCount > 1 {
                            userCartRef.updateData(["numberInCart": FieldValue.increment(Int64(-1))])
                        } else {
                            userCartRef.delete()
                        }
                    }
                }
            } else if action == .add {
                let newItem = Sneaker(
                    id: itemId,
                    name: item.name,
                    description: item.description,
                    price: item.price,
                    inCart: true,
                    photoID: item.photoID,
                    numberInCart: item.numberInCart
                )

                do {
                    try userCartRef.setData(from: newItem)
                } catch {
                    print("\(error.localizedDescription)")
                }
            }
        }
    }


    
    func itemCount(item: Sneaker) -> Int {
        return cartItems.first(where: { $0.id == item.id })?.numberInCart ?? 0
    }

    func isInCart(item: Sneaker) -> Bool {
        return cartItems.contains(where: { $0.id == item.id })
    }
}
