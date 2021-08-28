//  CategoryTableViewCell.swift
//  Decor
//  Created by iOS-Appentus on 06/May/2020.
//  Copyright © 2020 iOS-Appentus. All rights reserved.


import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var viewContainer:UIView!
    @IBOutlet weak var imgCate:UIImageView!
    @IBOutlet weak var cateName:UILabel!
    @IBOutlet weak var cateDetails:UILabel!
    
    @IBOutlet weak var btnSelect:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setupHexagonImageView(imgCate)
        setUpHexagonView(viewContainer)
    }
    
}

func setupHexagonImageView(_ imageView:UIView) {
    let lineWidth: CGFloat = 0
    let path = roundedPolygonPath(rect: imageView.bounds, lineWidth: lineWidth, sides: 6, cornerRadius: 10, rotationOffset: CGFloat(Double.pi / 2.0))

    let mask = CAShapeLayer()
    mask.path = path.cgPath
    mask.lineWidth = lineWidth
    mask.strokeColor = UIColor.clear.cgColor
    mask.fillColor = UIColor.white.cgColor
        
    imageView.layer.mask = mask

    let border = CAShapeLayer()
    border.path = path.cgPath
    border.lineWidth = lineWidth
    border.strokeColor = UIColor.white.cgColor
    border.fillColor = UIColor.clear.cgColor
    imageView.layer.addSublayer(border)
}



 func setUpHexagonView(_ view:UIView) {
    let lineWidth: CGFloat = 0
    let path = roundedPolygonPath(rect: view.bounds, lineWidth: lineWidth, sides: 6, cornerRadius: 10, rotationOffset: CGFloat(Double.pi / 2.0))

    let mask = CAShapeLayer()
    mask.path = path.cgPath
    mask.lineWidth = lineWidth
    mask.strokeColor = UIColor.clear.cgColor
    mask.fillColor = UIColor.white.cgColor
    
    mask.shadowColor = UIColor.red.cgColor
    mask.shadowOffset = CGSize(width:4, height:4)
    mask.shadowOpacity = 1
    mask.shadowRadius = 10
    
    view.layer.mask = mask

    let border = CAShapeLayer()
    border.path = path.cgPath
    border.lineWidth = lineWidth
    border.strokeColor = UIColor.white.cgColor
    border.fillColor = UIColor.clear.cgColor
    view.layer.addSublayer(border)
}

 func roundedPolygonPath(rect: CGRect, lineWidth: CGFloat, sides: NSInteger, cornerRadius: CGFloat, rotationOffset: CGFloat = 0)
 -> UIBezierPath {
    let path = UIBezierPath()
    let theta: CGFloat = CGFloat(2.0 * Double.pi) / CGFloat(sides) // How much to turn at every corner
    let offset: CGFloat = cornerRadius * tan(theta / 2.0)     // Offset from which to start rounding corners
    let width = min(rect.size.width, rect.size.height)        // Width of the square

    let center = CGPoint(x: rect.origin.x + width / 2.0, y: rect.origin.y + width / 2.0)

    // Radius of the circle that encircles the polygon
    // Notice that the radius is adjusted for the corners, that way the largest outer
    // dimension of the resulting shape is always exactly the width - linewidth
    let radius = (width - lineWidth + cornerRadius - (cos(theta) * cornerRadius)) / 2.0

    // Start drawing at a point, which by default is at the right hand edge
    // but can be offset
    var angle = CGFloat(rotationOffset)

    let corner = CGPoint(x:center.x + (radius - cornerRadius) * cos(angle), y:center.y + (radius - cornerRadius) * sin(angle))
    path.move(to:CGPoint(x:corner.x + cornerRadius * cos(angle + theta), y:corner.y + cornerRadius * sin(angle + theta)))

    for _ in 0 ..< sides {
        angle += theta

        let corner = CGPoint(x:center.x + (radius - cornerRadius) * cos(angle), y:center.y + (radius - cornerRadius) * sin(angle))
        let tip = CGPoint(x:center.x + radius * cos(angle), y:center.y + radius * sin(angle))
        let start = CGPoint(x:corner.x + cornerRadius * cos(angle - theta), y:corner.y + cornerRadius * sin(angle - theta))
        let end = CGPoint(x:corner.x + cornerRadius * cos(angle + theta), y:corner.y + cornerRadius * sin(angle + theta))

        path.addLine(to: start)
        path.addQuadCurve(to: end, controlPoint: tip)
    }

    path.close()

    // Move the path to the correct origins
    let bounds = path.bounds
    let transform = CGAffineTransform(translationX: -bounds.origin.x + rect.origin.x + lineWidth / 2.0,
                                      y: -bounds.origin.y + rect.origin.y + lineWidth / 2.0)
    path.apply(transform)

    return path
}


