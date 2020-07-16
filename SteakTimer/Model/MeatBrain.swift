//
//  MeatBrain.swift
//  SteakTimer
//
//  Created by wade chen on 3/7/20.
//  Copyright © 2020 Chris. All rights reserved.
//

import Foundation

struct MeatBrain {
    
    var meat : Meat?
    
    mutating func pickMeatDoneness(choice: String) {
        
        switch choice {
        case "RARE":
            meat = Meat(temperature: "30-51C", time: [2,30])
        case "MEDIUM RARE":
            meat = Meat(temperature: "57-63C", time: [3,30])
        case "MEDIUM":
            meat = Meat(temperature: "63-68C", time: [4,0])
        case "WELL DONE":
            meat = Meat(temperature: "77C+", time: [6,0])
        default:
            break
        }
        
    }
    
    func getTemperature() -> String {
        return meat?.temperature ?? ""
    }
    
    func getCookingTimeMin() -> Int {
        return meat?.time[0] ?? 0
    }
 
    func getCookingTimeSec() -> Int {
        return meat?.time[1] ?? 0
    }
    
}
