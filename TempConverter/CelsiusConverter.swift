//
//  CelsiusConverter.swift
//  TempConverter
//
//  Created by David Svensson on 2021-11-23.
//

import Foundation

class CelsiusConverter {
    
    
    func degreesFahrenheit(degreesCelsius: Int) -> Int {
        
        let degreeF = 1.8 * Double(degreesCelsius) + 32.0
        
        return Int(round(degreeF))
    }
    
    
}
