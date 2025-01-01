import SwiftUI

struct NewDiaryEntryView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("标题", text: $title)
                TextEditor(text: $content)
                    .frame(height: 200)
            }
            .navigationTitle("新日记")
            .toolbar {
                Button("保存") {
                    diaryViewModel.addEntry(title: title, content: content)
                    dismiss()
                }
            }
        }
    }
} 
