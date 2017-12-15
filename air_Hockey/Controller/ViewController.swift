import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mur_gauche: UIView!
    @IBOutlet weak var mur_droite: UIView!
    @IBOutlet weak var mur_haut: UIView!
    @IBOutlet weak var mur_bas: UIView!
    @IBOutlet weak var balle: UIView!
    @IBOutlet weak var finger_mover: UIView!
    @IBOutlet weak var game_over: UIView!
    @IBOutlet weak var mur_bas1: UIView!
    @IBOutlet weak var mur_bas2: UIView!
    @IBOutlet weak var carre1: UIView!
    @IBOutlet weak var carre2: UIView!
    @IBOutlet weak var carre3: UIView!
    @IBOutlet weak var carre4: UIView!
    @IBOutlet weak var carre5: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var winLabel: UIView!
    
    //---
    var objet_bounce: Bounce!
    var cos: Double!
    var sin: Double!
    var aTimer: Timer!
    var score = 0
    
    //---
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objet_bounce = Bounce(ball: balle, left_window: mur_gauche, right_window: mur_droite, top_window: mur_haut, bottom_window: mur_bas, bottom_window1: mur_bas1, bottom_window2: mur_bas2, square1: carre1, square2: carre2, square3: carre3, square4: carre4, square5: carre5)
        
        lancerAnimation()
        
        balle.center.x = UIScreen.main.bounds.width / 2
        balle.center.y = UIScreen.main.bounds.height / 5
    }
    //---
    func lancerAnimation() {
        //angle au hasard
        let degrees: Double = Double(arc4random_uniform(360))
        print(degrees)
        cos = __cospi(degrees/120)
        sin = __sinpi(degrees/120)
        aTimer = Timer.scheduledTimer(timeInterval: 0.002, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
        
    }
    //--- Fonction pour montrer le texte que la personne a gagné le jeux
    func win() {
        if winLabel.isHidden == true {
            winLabel.isHidden = false
        } else {
            winLabel.isHidden = true
        }
        aTimer.invalidate()
        aTimer = nil
    }
    //--- Fonction que montre le label GAME OVER
    func gameOver() {
        if game_over.isHidden == true {
            game_over.isHidden = false
        } else {
            game_over.isHidden = true
        }
    }
    
    @objc func animation() {
        balle.center.x += CGFloat(cos)
        balle.center.y += CGFloat(sin)
        
        sin = objet_bounce.returnCosSinAfterTouch(sin: sin, cos: cos)[0]
        cos = objet_bounce.returnCosSinAfterTouch(sin: sin, cos: cos)[1]
        
        if balle.frame.intersects(game_over.frame) {
            aTimer.invalidate()
            aTimer = nil
            gameOver()
            
        }
        //----- Controler et faire l'incrémentation du Score (quand l'utilisateur fait 150 points, il gagne et le jeu arrête)
        if balle.frame.intersects(mur_bas.frame) {
            score += 10
            scoreLabel.text = String(score)
            if score >= 150 {
                win()
            }
        }
        // --- Les conditions de colision avec les joueurs de Boston
        if balle.frame.intersects(carre1.frame) {
            let upperX: UInt32 = 350
            let upperY: UInt32 = 560
            let lowerX: UInt32 = 15
            let lowerY: UInt32 = 41
            
            
            let positionAleatoireX = arc4random_uniform(upperX - lowerX) + lowerX
            let positionAleatoireY = arc4random_uniform(upperY - lowerY) + lowerY
            
            carre1.center.x = CGFloat(positionAleatoireX)
            carre1.center.y = CGFloat(positionAleatoireY)
        }
        if balle.frame.intersects(carre2.frame) {
            let upperX: UInt32 = 350
            let upperY: UInt32 = 560
            let lowerX: UInt32 = 15
            let lowerY: UInt32 = 41


            let positionAleatoireX = arc4random_uniform(upperX - lowerX) + lowerX
            let positionAleatoireY = arc4random_uniform(upperY - lowerY) + lowerY

            carre2.center.x = CGFloat(positionAleatoireX)
            carre2.center.y = CGFloat(positionAleatoireY)
        }
        if balle.frame.intersects(carre3.frame) {
            let upperX: UInt32 = 350
            let upperY: UInt32 = 560
            let lowerX: UInt32 = 15
            let lowerY: UInt32 = 41
            
            
            let positionAleatoireX = arc4random_uniform(upperX - lowerX) + lowerX
            let positionAleatoireY = arc4random_uniform(upperY - lowerY) + lowerY
            
            carre3.center.x = CGFloat(positionAleatoireX)
            carre3.center.y = CGFloat(positionAleatoireY)
        }
        if balle.frame.intersects(carre4.frame) {
            let upperX: UInt32 = 350
            let upperY: UInt32 = 560
            let lowerX: UInt32 = 15
            let lowerY: UInt32 = 41
            
            
            let positionAleatoireX = arc4random_uniform(upperX - lowerX) + lowerX
            let positionAleatoireY = arc4random_uniform(upperY - lowerY) + lowerY
            
            carre4.center.x = CGFloat(positionAleatoireX)
            carre4.center.y = CGFloat(positionAleatoireY)
        }
        if balle.frame.intersects(carre5.frame) {
            let upperX: UInt32 = 350
            let upperY: UInt32 = 560
            let lowerX: UInt32 = 15
            let lowerY: UInt32 = 41
            
            
            let positionAleatoireX = arc4random_uniform(upperX - lowerX) + lowerX
            let positionAleatoireY = arc4random_uniform(upperY - lowerY) + lowerY
            
            carre5.center.x = CGFloat(positionAleatoireX)
            carre5.center.y = CGFloat(positionAleatoireY)
        }
    }
    // ---- Fonction pour controller le guardien
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let touch: UITouch = touches.first!
        
        if touch.view == finger_mover {
            finger_mover.center.x = touch.location(in: self.view).x
            mur_bas.center.x = finger_mover.center.x
        }
    }

//--------------------------------------------------
//--------------------------------------------------

}
