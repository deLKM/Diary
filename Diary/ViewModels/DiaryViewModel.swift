import SwiftUI

class DiaryViewModel: ObservableObject {
    @Published var entries: [DiaryEntry] = []
    
    func addEntry(title: String, content: String) {
        let entry = DiaryEntry(title: title, content: content, date: Date())
        entries.append(entry)
    }
    
    func deleteEntry(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
    }
} 
