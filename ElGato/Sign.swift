//
//  Sign.swift
//  ElGato
//
//  Created by CEDAM 25 on 10/16/19.
//  Copyright © 2019 CEDAM 25. All rights reserved.
//

import Foundation
import GameplayKit

let noRandom = GKRandomDistribution(lowestValue: 0, highestValue: 4)


enum Señal {
    case Piedra, Papel, Tijeras, Lagarto, Spock
    
    var emoji: String{
        switch self {
        case .Piedra:
            return "👊🏿"
        case .Papel:
            return "🖐🏿"
        case .Tijeras:
            return "✌🏿"
        case .Spock:
            return "🖖🏿"
        case .Lagarto:
            return "🦖"
        }
    }
    
    func turno (_ maquina: Señal) -> Estado{
        switch self {
        case .Piedra:
            switch maquina{
            case .Piedra:
                return Estado.Empataste
            case .Papel:
                return Estado.Perdiste
            case .Tijeras:
                return Estado.Ganaste
            case .Lagarto:
                return Estado.Ganaste
            case .Spock:
                return Estado.Perdiste
            }
        case .Papel:
            switch maquina{
                
            case .Piedra:
                return Estado.Ganaste
            case .Papel:
                return Estado.Empataste
            case .Tijeras:
                return Estado.Perdiste
            case .Lagarto:
                return Estado.Perdiste
            case .Spock:
                return Estado.Ganaste
            }
        case .Tijeras:
            switch maquina{
            case .Piedra:
                return Estado.Perdiste
            case .Papel:
                return Estado.Ganaste
            case .Tijeras:
                return Estado.Empataste
            case .Lagarto:
                return Estado.Ganaste
            case .Spock:
                return Estado.Perdiste
            }
        case .Lagarto:
            switch maquina{
                
            case .Piedra:
                return Estado.Perdiste
            case .Papel:
                return Estado.Ganaste
            case .Tijeras:
                return Estado.Perdiste
            case .Lagarto:
                return Estado.Empataste
            case .Spock:
                return Estado.Ganaste
            }
        case .Spock:
            switch maquina{
                
            case .Piedra:
                return Estado.Ganaste
            case .Papel:
                return Estado.Perdiste
            case .Tijeras:
                return Estado.Ganaste
            case .Lagarto:
                return Estado.Perdiste
            case .Spock:
                return Estado.Empataste
            }
        }
    }
}


func señalAleatoria() -> Señal{
    
    let señal = noRandom.nextInt()
    
    if señal == 0{
        return .Piedra
    }else if señal == 1{
        return .Papel
    }else if señal == 2{
        return .Tijeras
    }
    else if señal == 3{
        return .Lagarto
    }
    else{
        return .Spock
    }

}
