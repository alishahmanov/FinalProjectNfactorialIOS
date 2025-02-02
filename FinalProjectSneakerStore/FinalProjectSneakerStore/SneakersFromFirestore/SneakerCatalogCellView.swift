

import SwiftUI

struct SneakerCatalogCellView: View {
    var sneaker: Sneaker
    @ObservedObject var cartManager: CartManager
    @State var flag = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(sneaker.photoID)
                .resizable()
                .scaledToFit()
                .frame(width: 152, height: 155)
                .cornerRadius(8)

            Text(sneaker.name)
                .frame(height: 18, alignment: .leading)
                .font(.system(size: 16))

            Text(sneaker.description)
                .frame(height: 16, alignment: .leading)
                .font(.system(size: 12))
                .foregroundColor(.gray)

            HStack {
                if flag {
                    Text("\(sneaker.numberInCart + 1) •")
                        .font(.system(size: 12))
                        .foregroundColor(.black)
                        .bold()
                }
                
                Text("$\(Int(sneaker.price))")
                    .font(.system(size: 12))
                    .bold()
            }
            Button(action: {
                let action: CartAction = cartManager.isInCart(item: sneaker) ? .remove : .add
                cartManager.toggleCartItem(item: sneaker, action: action)
            }) {
                Text(cartManager.isInCart(item: sneaker) ? "Remove" : "Add to cart")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 152, height: 36)
                    .background(cartManager.isInCart(item: sneaker) ? Color.gray : Color.black)
                    .cornerRadius(15)
                    .padding(.top, 10)
            }

        }
        .frame(width: 152, height: 290)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

