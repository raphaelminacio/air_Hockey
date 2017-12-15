//--------------------------------------------------
//--------------------------------------------------
import UIKit
import Foundation
//--------------------------------------------------
//--------------------------------------------------
class Bounce {
    //--------------------------------------------------
    var b: UIView!
    var lw: UIView!
    var rw: UIView!
    var tw: UIView!
    var bw: UIView!
    var bw1: UIView!
    var bw2: UIView!
    var car1: UIView!
    var car2: UIView!
    var car3: UIView!
    var car4: UIView!
    var car5: UIView!
    //--------------------------------------------------
    init(ball b: UIView,
         left_window lw: UIView,
         right_window rw: UIView,
         top_window tw: UIView,
         bottom_window bw: UIView,
         bottom_window1 bw1: UIView,
         bottom_window2 bw2: UIView,
         square1 car1: UIView,
         square2 car2: UIView,
         square3 car3: UIView,
         square4 car4: UIView,
         square5 car5: UIView) {
        self.b = b
        self.lw = lw
        self.rw = rw
        self.tw = tw
        self.bw = bw
        self.bw1 = bw1
        self.bw2 = bw2
        self.car1 = car1
        self.car2 = car2
        self.car3 = car3
        self.car4 = car4
        self.car5 = car5
        
    }
    //--------------------------------------------------
    func returnCosSinAfterTouch(sin s: Double, cos c: Double) -> [Double] {
        let r = atan2f(Float(s), Float(c))
        var d = r * (180 / Float(Double.pi))
        if b.frame.intersects(lw.frame) || b.frame.intersects(rw.frame) {
            d = 180 - d
        }
        if b.frame.intersects(tw.frame) {
            let p = abs(d)
            d = p
        }
        if b.frame.intersects(bw.frame) {
            let n = (d) * -1
            d = n
        }
        if b.frame.intersects(bw1.frame) {
            let n1 = (d) * -1
            d = n1
        }
        if b.frame.intersects(bw2.frame) {
            let n2 = (d) * -1
            d = n2
        }
        if b.frame.intersects(car1.frame) {
            let c1 = (d) * -1
            d = c1
        }
        if b.frame.intersects(car2.frame) {
            let c2 = (d) * -1
            d = c2
        }
        if b.frame.intersects(car3.frame) {
            let c3 = (d) * -1
            d = c3
        }
        if b.frame.intersects(car4.frame) {
            let c4 = (d) * -1
            d = c4
        }
        if b.frame.intersects(car5.frame) {
            let c5 = (d) * -1
            d = c5
        }
        return [__sinpi(Double(d/180.0)), __cospi(Double(d/180.0))]
    }
    //--------------------------------------------------
}
//--------------------------------------------------
//--------------------------------------------------

