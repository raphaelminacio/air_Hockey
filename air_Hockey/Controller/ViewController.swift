import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mur_gauche: UIView!
    @IBOutlet weak var mur_droite: UIView!
    @IBOutlet weak var mur_haut: UIView!
    @IBOutlet var mur_bas: UIView!
    @IBOutlet weak var balle: UIView!
    @IBOutlet weak var finger_mover: UIView!
    @IBOutlet weak var game_over: UIView!
    @IBOutlet weak var mur_bas1: UIView!
    @IBOutlet weak var mur_bas2: UIView!
    @IBOutlet weak var carre1: UIView!
    @IBOutlet weak var carre2: UIView!
    @IBOutlet weak var carre3: UIView!
    //---
    var objet_bounce: Bounce!
    var cos: Double!
    var sin: Double!
//    var cosr: Double!
//    var sinr: Double!
    var aTimer: Timer!
    
    //---
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objet_bounce = Bounce(ball: balle, left_window: mur_gauche, right_window: mur_droite, top_window: mur_haut, bottom_window: mur_bas, bottom_window1: mur_bas1, bottom_window2: mur_bas2, square1: carre1, square2: carre2, square3: carre3)
        
        lancerAnimation()
        
        balle.center.x = UIScreen.main.bounds.width / 2
        balle.center.y = UIScreen.main.bounds.height / 5
    }
    //---
    func lancerAnimation() {
        //angle au hasard
        let degrees: Double = Double(arc4random_uniform(360))
        print(degrees)
        cos = __cospi(degrees/180)
        sin = __sinpi(degrees/180)
        aTimer = Timer.scheduledTimer(timeInterval: 0.004, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
        
    }
    //---
    
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
            
            carre2.center.x = CGFloat(positionAleatoireX)
            carre2.center.y = CGFloat(positionAleatoireY)
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesMoved(touches, with: event)
            let touch: UITouch = touches.first!
            
            if touch.view == finger_mover {
                finger_mover.center.x = touch.location(in: self.view).x
                mur_bas.center.x = finger_mover.center.x
            }
        }

    //---
    }

//--------------------------------------------------
//--------------------------------------------------

}
