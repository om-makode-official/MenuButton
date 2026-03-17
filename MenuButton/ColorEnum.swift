//
//  ColorEnum.swift
//  MenuButton
//
//  Created by Sai Krishna on 3/17/26.
//

import Foundation
import SwiftUI

enum MenuColor{
    case questionmarkBubble
    case docText
    case image
    case textBubble
    case envelope
    
    var bgColor: LinearGradient{
        switch self {
        case .questionmarkBubble:
            return LinearGradient(colors: [Color(hex: "#5867FE"), Color(hex: "#3A9BFF")], startPoint: .top, endPoint: .bottom)
             
        case .docText:
            return LinearGradient(colors: [Color.white], startPoint: .top, endPoint: .bottom)
        case .image:
            return LinearGradient(colors: [Color(hex: "#C548E5"), Color(hex: "#5A4ED1")], startPoint: .top, endPoint: .bottom)
        case .textBubble:
            return LinearGradient(colors: [Color(hex: "#00B5AC"), Color(hex: "#096F6A")], startPoint: .top, endPoint: .bottom)
        case .envelope:
            return LinearGradient(colors: [Color(hex: "#EE211F"), Color(hex: "#771110")], startPoint: .top, endPoint: .bottom)
        }
    }
}


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
