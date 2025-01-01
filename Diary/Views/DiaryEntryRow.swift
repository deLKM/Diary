import SwiftUI

struct DiaryEntryRow: View {
    let entry: DiaryEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(entry.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.blue)
                Text(entry.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Image(systemName: "clock")
                    .foregroundColor(.blue)
                    .padding(.leading, 8)
                Text(entry.date, style: .time)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            if !entry.content.isEmpty {
                Text(entry.content)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                    .padding(.top, 4)
            }
        }
        .padding(.vertical, 8)
        .contentShape(Rectangle())
    }
} 
