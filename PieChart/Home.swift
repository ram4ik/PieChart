//
//  Home.swift
//  PieChart
//
//  Created by Ramill Ibragimov on 17.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 20, height: 15)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "bell.fill")
                            .foregroundColor(.black)
                    }
                }
                Text("My Usage")
                    .fontWeight(.bold)
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding()
            .overlay(Rectangle().stroke(Color.black.opacity(0.05), lineWidth: 2))
            
            GeometryReader { g in
                ZStack {
                    ForEach(0..<data.count) { i in
                        DrawShape(center: CGPoint(x: g.frame(in: .global).width / 2, y: g.frame(in: .global).height / 2), index: i)
                    }
                }
            }.frame(height: 360)
            .padding(.top, 20)
            .clipShape(Circle())
            .shadow(radius: 8)
            
            VStack {
                ForEach(data) { i in
                    
                    HStack {
                        Text(i.name)
                            .frame(width: 100)
                        
                        GeometryReader { g in
                            HStack {
                                Spacer(minLength: 0)
                                
                                Rectangle()
                                    .fill(i.color)
                                    .frame(width: self.getWidth(width: g.frame(in: .global).width, value: i.percent), height: 10)
                                
                                Text(String(format: "\(i.percent)", "%.0f"))
                                    .fontWeight(.bold)
                                    .padding(.leading, 10)
                            }
                        }
                    }.padding(.top, 18)
                }
            }.padding()
            
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
    
    func getWidth(width: CGFloat, value: CGFloat) -> CGFloat {
        let temp = value / 100
        return temp * width
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
