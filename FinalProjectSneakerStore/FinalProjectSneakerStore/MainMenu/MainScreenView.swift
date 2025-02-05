import SwiftUI

struct MainScreenView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab: Int = 1
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    switch selectedTab {
                    case 1:
                        CatalogView()
                    case 2:
                        CartView()
                    case 3:
                        ProfileView()
                    default:
                        CatalogView()
                    }
                }
                .overlay(
                    CustomTab(selectedIndex: $selectedTab)
                        .frame(width: geometry.size.width, height: 60)
                        .position(x: geometry.size.width / 2, y: geometry.size.height - 30)
                    , alignment: .bottom
                )
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MainScreenView()
}


