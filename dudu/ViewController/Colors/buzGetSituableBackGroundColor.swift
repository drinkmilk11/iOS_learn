//
//  buzGetSituableBackGroundColor.swift
//  dudu
//
//  Created by dd_luliluli on 2024/8/16.
//

import Foundation
import UIKit

class OnAirGroupBackGroundColor {
    static func getSuitableBackGroundColor(clusters: [Cluster]) -> UIColor {
        var R: CGFloat = 0
        var G: CGFloat = 0
        var B: CGFloat = 0
        
        for cluster in clusters {
            R = R + cluster.center.x
            G = G + cluster.center.y
            B = B + cluster.center.z
        }
        R = R / CGFloat(clusters.count)
        G = G / CGFloat(clusters.count)
        B = B / CGFloat(clusters.count)
        return UIColor(red: R, green: G, blue: B, alpha: 1)
    }
    
    func cluster(points : [Point], into k : Int) -> [Cluster] {
        var clusters = [Cluster]()
        for _ in 0 ..< k {
            var p = points.randomElement()
            while p == nil || clusters.contains(where: {$0.center == p}) {
                p = points.randomElement()
            }
            clusters.append(Cluster(center: p!))
        }
        
        for i in 0 ..< 10 {
            clusters.forEach {
                $0.points.removeAll()
            }
            for p in points {
                let closest = findClosest(for: p, from: clusters)
                closest.points.append(p)
            }
            var converged = true
            clusters.forEach {
                let oldCenter = $0.center
                $0.updateCenter()
                if oldCenter.distanceSquared(to: $0.center) > 0.0001 {
                    converged = false
                }
            }
            if converged {
                print("Converged. Took \(i) iterations")
                break;
            }
        }
        return clusters
    }
    
    private func findClosest(for p : Point, from clusters: [Cluster]) -> Cluster {
        return clusters.min(by: {$0.center.distanceSquared(to: p) < $1.center.distanceSquared(to: p)})!
    }
}

extension OnAirGroupBackGroundColor {
    class Cluster {
        var points = [Point]()
        var center : Point
        init(center : Point) {
            self.center = center
        }
        func calculateCurrentCenter() -> Point {
            if points.isEmpty {
                return Point.zero
            }
            return points.reduce(Point.zero, +) / points.count
        }
        func updateCenter() {
            if points.isEmpty {
                return
            }
            let currentCenter = calculateCurrentCenter()
            center = points.min(by: {$0.distanceSquared(to: currentCenter) < $1.distanceSquared(to: currentCenter)})!
        }
    }
}
extension OnAirGroupBackGroundColor {
    struct Point : Equatable {
        let x : CGFloat
        let y : CGFloat
        let z : CGFloat
        init(_ x: CGFloat, _ y : CGFloat, _ z : CGFloat) {
            self.x = x
            self.y = y
            self.z = z
        }
        init(from color : UIColor) {
            var r : CGFloat = 0
            var g : CGFloat = 0
            var b : CGFloat = 0
            var a : CGFloat = 0
            if color.getRed(&r, green: &g, blue: &b, alpha: &a) {
                x = r
                y = g
                z = b
            } else {
                x = 0
                y = 0
                z = 0
            }
        }
        static let zero = Point(0, 0, 0)
        static func == (lhs: Point, rhs: Point) -> Bool {
            return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
        }
        static func +(lhs : Point, rhs : Point) -> Point {
            return Point(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z)
        }
        static func /(lhs : Point, rhs : CGFloat) -> Point {
            return Point(lhs.x / rhs, lhs.y / rhs, lhs.z / rhs)
        }
        static func /(lhs : Point, rhs : Int) -> Point {
            return lhs / CGFloat(rhs)
        }
        func distanceSquared(to p : Point) -> CGFloat {
            return (self.x - p.x) * (self.x - p.x)
                + (self.y - p.y) * (self.y - p.y)
                + (self.z - p.z) * (self.z - p.z)
        }
        func toUIColor() -> UIColor {
            return UIColor(red: x, green: y, blue: z, alpha: 1)
        }
    }
}


extension UIImage {

    func resizedForStandard(to size : CGSize) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        //disable HDR:
        format.preferredRange = .standard
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        let result = renderer.image { (context) in
            self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        }
        return result
    }
    func getPixels() -> [UIColor] {
        guard let cgImage = self.cgImage else {
            return []
        }
        guard let imageData = cgImage.dataProvider?.data as Data? else {
            return []
        }
        let size = cgImage.width * cgImage.height
        let buffer = UnsafeMutableBufferPointer<UInt32>.allocate(capacity: size)
        _ = imageData.copyBytes(to: buffer)
        var result = [UIColor]()
        result.reserveCapacity(size)
        for pixel in buffer {
            var r : UInt32 = 0
            var g : UInt32 = 0
            var b : UInt32 = 0
            if cgImage.byteOrderInfo == .orderDefault || cgImage.byteOrderInfo == .order32Big {
                r = pixel & 255
                g = (pixel >> 8) & 255
                b = (pixel >> 16) & 255
            } else if cgImage.byteOrderInfo == .order32Little {
                r = (pixel >> 16) & 255
                g = (pixel >> 8) & 255
                b = pixel & 255
            }
            let color = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1)
            result.append(color)
        }
        return result
    }

}
