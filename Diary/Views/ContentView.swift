//
//  ContentView.swift
//  Diary
//
//  Created by deLKM on 2025/1/1.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var diaryViewModel: DiaryViewModel
    @State private var showingNewEntry = false
    
    var body: some View {
        NavigationView {
            List(diaryViewModel.entries) { entry in
                DiaryEntryRow(entry: entry)
            }
            .navigationTitle("我的日记")
            .toolbar {
                Button(action: { showingNewEntry = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingNewEntry) {
                NewDiaryEntryView()
            }
        }
    }
} 
