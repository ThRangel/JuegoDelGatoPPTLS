//
//  GatoViewController.swift
//  ElGato
//
//  Created by CEDAM24 on 10/21/19.
//  Copyright © 2019 CEDAM 25. All rights reserved.
//

import UIKit
//aqui haré mi primer comit
class GatoViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    //1 es bombon, 2 es burbuja
    var chica = 1 //antes activePlayer
    var edoJuego = [0, 0, 0, 0, 0, 0, 0, 0, 0] //0 es empate, 1 bombon, 2 burbuja
    let combinacionGanadora = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [1,4,7],
        [0,3,6],
        [2,5,8],
        [0,4,8],
        [6,4,2] ]
    var activeGame = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = false
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y )
        
       // playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }

    @IBAction func playAgain(_ sender: Any) {
        
        edoJuego = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activeGame = true
        chica = 1
        playAgainButton.isHidden = false
        winnerLabel.isHidden = true
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
            
        }
        
        
        
    }
    @IBAction func action(_ sender: Any) {
        
        
        print("Boton presionado")
        //print((sender as //AnyObject).tag)
        let activarPosicion = (sender as AnyObject).tag-1
        if edoJuego[activarPosicion] == 0 && activeGame
        {
            edoJuego[activarPosicion] = chica
            if chica == 1{
                (sender as AnyObject).setImage(UIImage(named: "bombon.jpg"), for: [])
                chica = 2
                
                
            }else{
                (sender as AnyObject).setImage(UIImage(named: "burbuja.png"), for: [])
                chica = 1
            }
            for combinacion in combinacionGanadora{
                
                if edoJuego[combinacion[0]] != 0 && edoJuego[combinacion[0]] == edoJuego[combinacion[1]] && edoJuego[combinacion[1]] == edoJuego[combinacion[2]]
                    {
                    //gnador
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    //print(edoJuego[combinacion[0]])
                    if edoJuego[combinacion[0]] == 1
                       {
                        winnerLabel.text = "¡Bombon ha ganado!"
                         }else
                          {
                            winnerLabel.text = "¡Burbuja ha ganado!"
                          }
                    
                    
                    UIView.animate(withDuration : 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        
                    })
                   
                        
                        
                        
                }
                
            }
            activeGame = true
        
            for i in edoJuego{
                if i == 0{
                    activeGame = true
                    break
                }
                if activeGame == false{
                    winnerLabel.text = "It was a draw"
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                }
            }
    
    
        }
    }
    
    
    

    

    

}
