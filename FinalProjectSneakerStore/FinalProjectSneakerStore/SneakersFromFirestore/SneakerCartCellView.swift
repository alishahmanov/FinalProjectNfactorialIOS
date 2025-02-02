import SwiftUI

struct SneakerCartCellView: View {
    var sneaker: Sneaker
    @ObservedObject var cartManager: CartManager

    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            HStack(spacing: 16) {
                Image(sneaker.photoID)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(sneaker.name)
                        .font(.system(size: 16, weight: .bold))
                        .lineLimit(1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(sneaker.description)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Text("$\(Int(sneaker.price))")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 166, height: 36)
                        .foregroundColor(.black)
                        .overlay(
                            HStack(spacing: 16) {
                                
                                Button(action: {
                                    cartManager.decrementNumberInCart(for: sneaker)
                                }) {
                                    Image(systemName: "minus")
                                        .font(.system(size: 16, weight: .bold))
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.white)
                                        .background(Color.black)
                                        .clipShape(Circle())
                                }
                                
                                
                                Text("\(cartManager.itemCount(item: sneaker))")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.white)
                                
                                
                                Button(action: {
                                    cartManager.incrementNumberInCart(for: sneaker)
                                }) {
                                    Image(systemName: "plus")
                                        .font(.system(size: 16, weight: .bold))
                                        .frame(width: 32, height: 32)
                                        .foregroundColor(.white)
                                        .background(Color.black)
                                        .clipShape(Circle())
                                }
                            }
                        )
                    
                }
            }
            .padding(.vertical, 8)
        }
    }
}
