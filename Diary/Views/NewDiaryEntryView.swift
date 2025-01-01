import SwiftUI

struct NewDiaryEntryView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @State private var title = ""
    @State private var content = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("标题")) {
                    TextField("请输入标题", text: $title)
                        .font(.headline)
                }
                
                Section(header: Text("内容")) {
                    TextEditor(text: $content)
                        .frame(minHeight: 200)
                        .font(.body)
                }
            }
            .navigationTitle("新日记")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("取消") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("保存") {
                        if !title.isEmpty {
                            diaryViewModel.addEntry(title: title, content: content)
                            dismiss()
                        }
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}
