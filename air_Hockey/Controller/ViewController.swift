import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mur_gauche: UIView!
    @IBOutlet weak var mur_droite: UIView!
    @IBOutlet weak var mur_haut: UIView!
    @IBOutlet var mur_bas: UIView!
    @IBOutlet weak var balle: UIView!
    @IBOutlet weak var finger_mover: UIView!
    @IBOutlet weak var game_over: UIView!
    //---
    var objet_bounce: Bounce!
    var cos: Double!
    var sin: Double!
    var aTimer: Timer!
    
    //---
    
    override func viewDidLoad() {
        super.viewDidLoad()
        objet_bounce = Bounce(ball: balle, left_window: mur_gauche, right_window: mur_droite, top_window: mur_haut, bottom_window: mur_bas)
        
        balle.layer.cornerRadius = 12.5
        lancerAnimation()
    }
    //---
    func lancerAnimation() {
        //angle au hasard
        let degrees: Double = Double(arc4random_uniform(360))
        print(degrees)
        cos = __cospi(degrees/180)
        sin = __sinpi(degrees/180)
        aTimer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(animation), userInfo: nil, repeats: true)
        
    }
    //---
    @objc func animation() {
        balle.center.x += CGFloat(cos)
        balle.center.y += CGFloat(sin)
        
        sin = objet_bounce.returnCosSinAfterTouch(sin: sin, cos: cos)[0]
        cos = objet_bounce.returnCosSinAfterTouch(sin: sin, cos: cos)[1]
    }
    //---
}

//--------------------------------------------------
//--------------------------------------------------



