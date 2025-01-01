import SwiftUI

struct ContentView: View {
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @State private var showingNewEntry = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(diaryViewModel.entries) { entry in
                        DiaryEntryRow(entry: entry)
                            .background(Color(.systemBackground))
                            .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                    }
                    .onDelete(perform: diaryViewModel.deleteEntry)
                }
                .listStyle(InsetGroupedListStyle())
                
                if diaryViewModel.entries.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "note.text")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("还没有日记")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Button(action: { showingNewEntry = true }) {
                            Text("开始写日记")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .navigationTitle("我的日记")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingNewEntry = true }) {
                        Image(systemName: "square.and.pencil")
                            .font(.system(size: 16, weight: .semibold))
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingNewEntry) {
                NewDiaryEntryView()
            }
        }
    }
} 
