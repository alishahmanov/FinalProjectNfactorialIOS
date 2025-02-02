import SwiftUI

struct CatalogView: View {
    @StateObject private var viewModel = SneakerViewModel()
    @StateObject private var cartManager = CartManager()

    var body: some View {
        ScrollView {
            Text("Hello, sneakers!")
                .font(.headline)
                .padding(.top, 60)

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(viewModel.sneakers) { sneaker in
                    SneakerCatalogCellView(sneaker: sneaker, cartManager: cartManager)
                }
            }
            .padding()
        }
        .scrollContentBackground(.hidden)
        .edgesIgnoringSafeArea(.top)
        .frame(height: 690)
        .onAppear {
            viewModel.fetchSneakers()
            cartManager.fetchCart() 
        }
        .navigationBarHidden(true)
    }
}
#Preview {
    MainScreenView()
}
