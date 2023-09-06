//
//  YoutubePlayerView.swift
//  YoutubePlayer
//
//  Created by 藤治仁 on 2023/09/06.
//

import SwiftUI
import YoutubePlayer_in_WKWebView

struct YoutubePlayerView: UIViewRepresentable {
    
    var videoID: String

    func makeUIView(context: Context) -> WKYTPlayerView {
        return WKYTPlayerView()
    }
    
    func updateUIView(_ uiView: WKYTPlayerView, context: Context) {
        uiView.load(withVideoId: videoID)
    }
}
