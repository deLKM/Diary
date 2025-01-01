import SwiftUI

struct DiaryEntryRow: View {
    let entry: DiaryEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(entry.title)
                .font(.headline)
            Text(entry.date, style: .date)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
} 
