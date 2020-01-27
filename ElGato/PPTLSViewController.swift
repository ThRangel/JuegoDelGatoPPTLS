//
//  PPTLSViewController.swift
//  ElGato
//
//  Created by CEDAM 25 on 10/17/19.
//  Copyright © 2019 CEDAM 25. All rights reserved.
//

import UIKit

class PPTLSViewController: UIViewController {
    
    @IBOutlet weak var botonPiedra: UIButton!
    @IBOutlet weak var botonPapel: UIButton!
    @IBOutlet weak var botonTijera: UIButton!
    @IBOutlet weak var botonSpock: UIButton!
    @IBOutlet weak var lagarto: UIButton!
    @IBOutlet weak var señalMaquina: UILabel!
    @IBOutlet weak var estadoFInal: UILabel!
    @IBOutlet weak var volverJugar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func Reset(){
        señalMaquina.text = "🥑"
        estadoFInal.text = "Piedra Papel, tijeras, lagarto y Spock"
        botonPiedra.isHidden = false
        botonPiedra.isEnabled = true
        botonPapel.isHidden = false
        botonPapel.isEnabled = true
        botonTijera.isHidden = false
        botonTijera.isEnabled = true
        botonSpock.isHidden = false
        botonSpock.isEnabled = true
        lagarto.isHidden = false
        lagarto.isEnabled = true
    }
    
    func jugar(_ turno: Señal){
        botonPiedra.isEnabled = false
        botonPapel.isEnabled = false
        botonTijera.isEnabled = false
        botonSpock.isEnabled = false
        lagarto.isEnabled = false
        
        let maquina = señalAleatoria()
        señalMaquina.text = maquina.emoji
        
        let resultado = turno.turno(maquina)
        
        switch resultado {
            
        case .Inicio:
            estadoFInal.text = "Bienvenido"
        case .Ganaste:
            estadoFInal.text = "Ganaste!!! :3"
        case .Perdiste:
            estadoFInal.text = "Perdiste"
        case .Empataste:
            estadoFInal.text = "esmpate"
        }
    }
    
    @IBAction func selectPiedra(_ sender: UIButton) {
        jugar(.Piedra)
    }
    
    @IBAction func selectPapel(_ sender: UIButton) {
       jugar(.Papel)
    }
    
    @IBAction func selectTijeras(_ sender: UIButton) {
        jugar(.Tijeras)
    }
   
    @IBAction func selectSpock(_ sender: UIButton) {
        jugar(.Spock)
    }
    
    @IBAction func selectLagarto(_ sender: UIButton) {
        jugar(.Lagarto)
    }
    
    @IBAction func volverAJugar(_ sender: UIButton) {
        Reset()
    }
    
    
    
    
    

}
