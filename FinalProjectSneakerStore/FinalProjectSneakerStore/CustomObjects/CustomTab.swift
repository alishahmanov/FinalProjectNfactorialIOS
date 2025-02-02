
import SwiftUI

struct CustomTab: View {
    @Binding var selectedIndex: Int
    var body: some View {
        VStack {
            TabItemsView(selectedIndex: $selectedIndex)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
struct TabItemsView: View {
    @Binding var selectedIndex: Int
    var body: some View {
        VStack {
            Divider()
                .frame(height: 1)
                .background(Color.black)
            HStack() {
                Button {
                    self.selectedIndex = 1
                    
                } label: {
                    TabItemView(image: "house.fill", label: "Catalog", index: 1, selectedIndex: $selectedIndex)
                }
                .padding(.leading, 40)
                Spacer()
                Button {
                    self.selectedIndex = 2
                    
                } label: {
                    TabItemView(image: "cart.fill", label: "Cart", index: 2, selectedIndex: $selectedIndex)
                }
                Spacer()
                Button {
                    self.selectedIndex = 3
                    
                } label: {
                    TabItemView(image: "person.crop.circle.fill", label: "Profile", index: 3, selectedIndex: $selectedIndex)
                }
                .padding(.trailing, 40)
            }
            .padding(.vertical)
            
            .animation(.smooth, value: selectedIndex)
        }
    }
}
struct TabItemView: View {
    let image: String
    let label: String
    let index: Int
    @Binding var selectedIndex: Int
    var body: some View {
        VStack {
            ZStack {
                Image(systemName: image )
                    .frame(width: 32, height: 32)
                    .foregroundStyle((selectedIndex == index ) ? .black : .gray.opacity(0.5) )
                
                
            }
            Text(label)
                .font(.system(size: 12))
                .foregroundColor((selectedIndex == index ) ? .black : .gray.opacity(0.3) )
        }
    }

}

#Preview {
    CustomTab(selectedIndex: .constant(1))
}
