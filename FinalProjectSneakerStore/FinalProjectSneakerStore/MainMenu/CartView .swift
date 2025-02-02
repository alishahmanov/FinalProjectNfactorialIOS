import SwiftUI

struct CartView: View {
    @StateObject private var cartManager = CartManager()

    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Cart")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                
                if $cartManager.cartItems.isEmpty {
                    Text("Your cart is empty")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(cartManager.cartItems) { sneaker in
                        SneakerCartCellView(sneaker: sneaker, cartManager: cartManager)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    deleteSneaker(sneaker)
                                } label: {
                                    Text("Delete")
                                }
                            }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .onAppear {
                cartManager.fetchCart()
            }
        }
    }
    private func deleteSneaker(_ sneaker: Sneaker) {
        Task {
            do {
                try await cartManager.deleteSneakerFromCart(sneaker)
                
                if let index = cartManager.cartItems.firstIndex(where: { $0.id == sneaker.id }) {
                    cartManager.cartItems.remove(at: index) 
                }
                
                print("\(sneaker.name) удален из корзины")
            } catch {
                print(" \(error.localizedDescription)")
            }
        }
    }
}
#Preview {
    CartView()
}
