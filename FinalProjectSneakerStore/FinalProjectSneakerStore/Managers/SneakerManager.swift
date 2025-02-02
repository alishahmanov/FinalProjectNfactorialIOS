import Firebase
import FirebaseFirestore

public struct Sneaker: Identifiable, Codable {
    @DocumentID public var id: String?
    var name: String
    var description: String
    var price: Double
    var inCart: Bool
    var photoID: String
    var numberInCart: Int
}

@MainActor
class SneakerViewModel: ObservableObject {
    @Published var sneakers: [Sneaker] = []

    func fetchSneakers() {
        let db = Firestore.firestore()

        db.collection("sneakers").getDocuments { snapshot, error in
            if let error = error {
                print("Ошибка при загрузке данных: \(error.localizedDescription)")
                return
            }

            self.sneakers = snapshot?.documents.compactMap { document in
                try? document.data(as: Sneaker.self)
            } ?? []
        }
    }
}
