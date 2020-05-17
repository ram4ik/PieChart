//
//  DrawShape.swift
//  PieChart
//
//  Created by Ramill Ibragimov on 17.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct DrawShape: View {
    
    var center: CGPoint
    var index: Int
    
    var body: some View {
        Path { path in
            path.move(to: self.center)
            path.addArc(center: self.center, radius: 180, startAngle: .init(degrees: self.getDegreeFrom()), endAngle: .init(degrees: self.getDegreeTo()), clockwise: false)
        }.fill(data[index].color)
    }
    
    func getDegreeFrom() -> Double {
        
        if index == 0 {
            return 0
        }
        
        var temp: Double = 0
        
        for i in 0...index - 1 {
            temp += Double(data[i].percent / 100) * 360
        }
        return temp
    }
    
    func getDegreeTo() -> Double {
        var temp: Double = 0
        
        for i in 0...index {
            temp += Double(data[i].percent / 100) * 360
        }
        return temp
    }
}
