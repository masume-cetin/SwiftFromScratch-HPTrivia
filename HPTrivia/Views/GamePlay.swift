//
//  GamePlay.swift
//  HPTrivia
//
//  Created by masume çetin on 18.08.2025.
//

import SwiftUI
import AVKit

struct GamePlay: View {
    @State private var musicPlayer : AVAudioPlayer!
    @State private var sfxPlayer : AVAudioPlayer!
    @State private var animateViewsIn :Bool = false
    @State private var revealHint :Bool = false
    @Environment(Game.self) private var game
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.hogwarts)
                    .resizable()
                    .frame(width: geo.size.width * 3,height: geo.size.height * 1.05)
                    .overlay {
                        Rectangle()
                            .foregroundStyle(.black.opacity(0.8))
                    }
                VStack {
                    // MARK: controls
                    HStack{
                        Button("End Game"){
                            game.endGame()
                            dismiss()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red.opacity(0.5))
                        Spacer()
                        Text("Score : \(game.gameScore)")
                    }
                    .padding()
                    .padding(.vertical,30)
                    
                    // MARK: question
                    VStack{
                    if animateViewsIn {
                        Text(game.currentQuestion.question)
                            .font(.custom("PartyLetPlain", size: 50))
                            .multilineTextAlignment(.center)
                            .padding()
                            .transition(.scale)
                    } }
                    .animation(.easeInOut(duration: 2),value: animateViewsIn)
                    Spacer()
                    // MARK: hints
                    HStack{
                        VStack{
                        if animateViewsIn {
                            Image(systemName: "questionmark.app.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .foregroundStyle(.cyan)
                                .padding()
                                .transition(.offset(x:-geo.size.width/2))
                                .phaseAnimator([false,true]) { content, phase in
                                    content.rotationEffect(.degrees(phase ? -13 : -17))
                                }animation: { _ in
                                        .easeInOut(duration: 0.7)
                                }
                                .onTapGesture {
                                    withAnimation(.easeOut(duration: 1)) {
                                        revealHint = true
                                    }
                                    playFlipSound()
                                    //   game.currentQuestion
                                    game.questionScore -= 1
                                }
                                .rotation3DEffect(.degrees(revealHint ? 1440 : 0), axis: (x: 0, y: 1, z: 0))
                                .scaleEffect(revealHint ? 5 : 1)
                                .offset(x :revealHint ? geo.size.width/2 : 0)
                                .opacity(revealHint ? 0 : 1)
                                .overlay {
                                    Text(game.currentQuestion.hint)
                                        .padding(.leading , 20)
                                        .minimumScaleFactor(0.2)
                                        .multilineTextAlignment(.center)
                                        .opacity(revealHint ? 1 : 0)
                                        .scaleEffect(revealHint ? 1.33 : 1)
                                }
                        }
                        }.animation(.easeOut(duration: 1.5), value: animateViewsIn)
                        Spacer()
                    }
                    .padding()
                    
                    
                    // MARK: answers
                    Spacer()
                }
                .frame(width: geo.size.width,height: geo.size.height)
                .foregroundStyle(.white)
                // MARK: celebration
            }
            .frame(width: geo.size.width,height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            animateViewsIn = true
            }
            game.startGame()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            playMusic()
            }
        }
    }
    private func playMusic() {
        let songs = ["let-the-mystery-unfold","spellcraft","hiding-place-in-the-forest","deep-in-the-dell"]
        let song = songs.randomElement()!
        let sound = Bundle.main.path(forResource:song,ofType:"mp3")
        musicPlayer = try! AVAudioPlayer(contentsOf:URL(filePath: sound!))
        musicPlayer.numberOfLoops = -1
        musicPlayer.volume = 0.1
       // musicPlayer.play()
    }
    private func playFlipSound() {
        let sound = Bundle.main.path(forResource:"page-flip",ofType:"mp3")
        sfxPlayer = try! AVAudioPlayer(contentsOf:URL(filePath: sound!))
        sfxPlayer.play()
    }
    private func playWrongSound() {
        let sound = Bundle.main.path(forResource:"negative-beeps",ofType:"mp3")
        sfxPlayer = try! AVAudioPlayer(contentsOf:URL(filePath: sound!))
       sfxPlayer.play()
    }
    private func playCorrectSound() {
        let sound = Bundle.main.path(forResource:"magic-wand",ofType:"mp3")
        sfxPlayer = try! AVAudioPlayer(contentsOf:URL(filePath: sound!))
        sfxPlayer.play()
    }
}

#Preview {
    GamePlay()
        .environment(Game())
}
