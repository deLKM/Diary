//
//  DiaryApp.swift
//  Diary
//
//  Created by deLKM on 2025/1/1.
//

import SwiftUI

@main
struct DiaryApp: App {
    @StateObject private var diaryViewModel = DiaryViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(diaryViewModel)
        }
    }
}
