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
    //---
    var objet_bounce: Bounce!
    var cos: Double!
    var sin: Double!
    var aTimer: Timer!
    
    //---
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objet_bounce = Bounce(ball: balle, left_window: mur_gauche, right_window: mur_droite, top_window: mur_haut, bottom_window: mur_bas, bottom_window1: mur_bas1, bottom_window2: mur_bas2)
        
        lancerAnimation()
        
        balle.center.x = UIScreen.main.bounds.width / 2
        balle.center.y = UIScreen.main.bounds.height / 4
    }
    //---
    func lancerAnimation() {
        //angle au hasard
        let degrees: Double = Double(arc4random_uniform(360))
        print(degrees)
        cos = __cospi(degrees/180)
        sin = __sinpi(degrees/180)
        aTimer = Timer.scheduledTimer(timeInterval: 0.002, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
        
    }
    //---
    @objc func animation() {
        balle.center.x += CGFloat(cos)
        balle.center.y += CGFloat(sin)
        
        if balle.frame.intersects(game_over.frame) {
            aTimer.invalidate()
            aTimer = nil
        }
        
        sin = objet_bounce.returnCosSinAfterTouch(sin: sin, cos: cos)[0]
        cos = objet_bounce.returnCosSinAfterTouch(sin: sin, cos: cos)[1]
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



