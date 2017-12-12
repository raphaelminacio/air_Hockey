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
    //--------------------------------------------------
    init(ball b: UIView,
         left_window lw: UIView,
         right_window rw: UIView,
         top_window tw: UIView,
         bottom_window bw: UIView,
         bottom_window1 bw1: UIView,
         bottom_window2 bw2: UIView) {
        self.b = b
        self.lw = lw
        self.rw = rw
        self.tw = tw
        self.bw = bw
        self.bw1 = bw1
        self.bw2 = bw2
        
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
            let n = (d) * -1
            d = n
        }
        if b.frame.intersects(bw2.frame) {
            let n = (d) * -1
            d = n
        }
        return [__sinpi(Double(d/180.0)), __cospi(Double(d/180.0))]
    }
    //--------------------------------------------------
}
//--------------------------------------------------
//--------------------------------------------------

