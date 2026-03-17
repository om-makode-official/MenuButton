//
//  ContentView.swift
//  MenuButton
//
//  Created by Sai Krishna on 3/17/26.
//

import SwiftUI

struct ContentView: View {
    @State private var isExpanded = false
    @State private var notificationDot = true
    
    var body: some View {
        VStack(spacing: 0){
            ZStack {
                if isExpanded {
                    Color.gray
//                        .background(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .onTapGesture {
                            toggleMenu()
                        }
                }
                
                ZStack {
                    menuOptionView(icon: "question", bgColor: MenuColor.questionmarkBubble.bgColor)
                        .offset(x: isExpanded ? 5 : 0, y: isExpanded ? -120 : 0)
                        .opacity(isExpanded ? 1 : 0)
                        .zIndex(isExpanded ? 1 : 0)
                    
                    menuOptionView(icon: "doc", bgColor: MenuColor.docText.bgColor)
                        .offset(x: isExpanded ? -45 : 0, y: isExpanded ? -110 : 0)
                        .opacity(isExpanded ? 1 : 0)
                        .zIndex(isExpanded ? 1 : 0)
                    
                    menuOptionView(icon: "img", bgColor: MenuColor.image.bgColor)
                        .offset(x: isExpanded ? -65 : 0, y: isExpanded ? -60 : 0)
                        .opacity(isExpanded ? 1 : 0)
                        .zIndex(isExpanded ? 1 : 0)
                    
                    menuOptionView(icon: "msg", bgColor: MenuColor.textBubble.bgColor, badgeCount: 12)
                        .offset(x: isExpanded ? -45 : 0, y: isExpanded ? -10 : 0)
                        .opacity(isExpanded ? 1 : 0)
                        .zIndex(isExpanded ? 1 : 0)
                    
                    menuOptionView(icon: "envelope", bgColor: MenuColor.envelope.bgColor)
                        .offset(x: isExpanded ? 5 : 0, y: isExpanded ? 0 : 0)
                        .opacity(isExpanded ? 1 : 0)
                        .zIndex(isExpanded ? 1 : 0)
                    
                    Button(action: {
                        toggleMenu()
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 48, height: 48)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.6), lineWidth: 1)
                                )
                            
                            Image(isExpanded ? "xmark" : "dots")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.white)
                                .frame(width: 30)
                                
                            
                            if !isExpanded {
                                Circle()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(Color(hex: "#E22F2A"))
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                                    .offset(x: 13, y: -20)
                            }
                        }
                        .offset(x: isExpanded ? -5 : 0, y: isExpanded ? -60 : 0)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(.horizontal, 16)
                .padding(.bottom, 11)
            }
            Rectangle()
                .frame(height: 50)
        }
        .ignoresSafeArea()

    }
    
    private func menuOptionView(icon: String, bgColor: LinearGradient, badgeCount: Int? = nil) -> some View{
        Button(action: {
            print("\(icon) tapped")
        }) {
            ZStack(alignment: .center) {
                Circle()
                    .fill(bgColor)
                    .frame(width: 48, height: 48)
                
                Image(icon)
                    .frame(width: 18, height: 24)
                
                if let badgeCount = badgeCount {
                    Text("\(badgeCount)")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.white)
                        .padding(3)
                        .background(Color(hex: "#E22F2A"))
                        .clipShape(Circle())
                        .offset(x: 20, y: -15)
                }
            }
        }
    }
    
    private func toggleMenu() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0)) {
            isExpanded.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


