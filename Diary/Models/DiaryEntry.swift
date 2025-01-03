import Foundation

struct DiaryEntry: Identifiable {
    let id = UUID()
    var title: String
    var content: String
    var date: Date
}
