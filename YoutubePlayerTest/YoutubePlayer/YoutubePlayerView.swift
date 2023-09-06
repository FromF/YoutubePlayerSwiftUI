//
//  YoutubePlayerView.swift
//  YoutubePlayer
//
//  Created by 藤治仁 on 2023/09/06.
//

import SwiftUI
import YoutubePlayer_in_WKWebView

struct YoutubePlayerView: UIViewRepresentable {
    
    let videoID: String
    
    private let playerView = WKYTPlayerView()
    
    class Coordinator: NSObject, WKYTPlayerViewDelegate {
        let parent: YoutubePlayerView

        init(_ parent: YoutubePlayerView) {
            self.parent = parent
        }
        
        func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
            print("playerViewDidBecomeReady")
        }
        
        func playerView(_ playerView: WKYTPlayerView, didChangeTo state: WKYTPlayerState) {
            print("PlayState \(state)")
        }
        
        func playerView(_ playerView: WKYTPlayerView, didChangeTo quality: WKYTPlaybackQuality) {
            print("PlayQuality \(quality)")
        }
        
        func playerView(_ playerView: WKYTPlayerView, receivedError error: WKYTPlayerError) {
            print("PlayError \(error)")
        }
        
        func playerView(_ playerView: WKYTPlayerView, didPlayTime playTime: Float) {
            print("PlayTime \(playTime)")
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKYTPlayerView {
        playerView.delegate = context.coordinator
        return playerView
    }
    
    func updateUIView(_ uiView: WKYTPlayerView, context: Context) {
        uiView.load(withVideoId: videoID)
    }
}
