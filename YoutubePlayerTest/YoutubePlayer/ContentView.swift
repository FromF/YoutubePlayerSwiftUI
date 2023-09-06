//
//  ContentView.swift
//  YoutubePlayer
//
//  Created by 藤治仁 on 2023/09/06.
//

import SwiftUI

struct ContentView: View {
    @State private var text = "https://youtu.be/zPcYnv5n60U?si=hRBwK4P5F6oJCrlt"
    @State private var urlText = ""
    var body: some View {
        VStack {
            TextField("https://youtu.be/XXXX", text: $text)
                .onSubmit {
                    urlText = text
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if let VideoID = extractVideoID(youtubeUrl: urlText) {
                YoutubePlayerView(videoID: VideoID)
            } else {
                Spacer()
                Text("Youtube URLを入力してください")
                Spacer()
            }
        }
    }
    
    /// YoutubeリンクからVideoIDを抽出する関数
    /// - Parameter youtubeUrl: YoutubeリンクのURL
    /// - Returns: VideoID
    func extractVideoID(youtubeUrl: String) -> String? {
        let pattern = "(http(s|):|)//(www\\.|)yout(.*?)\\/(embed\\/|watch.*?v=|)([a-z_A-Z0-9\\-]{11})"
        
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: youtubeUrl.utf16.count)
        if let match = regex?.firstMatch(in: youtubeUrl, options: [], range: range) {
            return Range(match.range(at: 6), in: youtubeUrl).map { String(youtubeUrl[$0]) }
        }
        
        return nil
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
