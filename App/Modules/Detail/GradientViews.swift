import UIKit
// MARK: - ENUM DIRECTION
enum Direction {
    case leftToRight
    case topToBottom
    case topLeftToBottomRight
    case bottomLeftToTopRight
    
    var points: (start: CGPoint, end: CGPoint) {
        switch self {
        case .leftToRight:
            (start: CGPoint(x: 0.0, y: 0.5), end: CGPoint(x: 1.0, y: 0.5))
        case .topToBottom:
            (start: CGPoint(x: 0.5, y: 0.0), end: CGPoint(x: 0.5, y: 1.0))
        case .topLeftToBottomRight:
            (start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: 1.0, y: 1.0))
        case .bottomLeftToTopRight:
            (start: CGPoint(x: 0.0, y: 1.0), end: CGPoint(x: 1.0, y: 0.0))
        }
    }
}
// MARK: - PROTOCOL AND EXTENSION
protocol GradientProtocol {
    var gradient: CAGradientLayer { get }
    var defaultStartColor: UIColor { get }
    var defaultEndColor: UIColor { get }
    var defaultPoints: [CGPoint] { get }
    
    func setDirection(_ direction: Direction)
    func setColors(start: UIColor, end: UIColor)
    func setupFrames()
    func defaultSetup()
}
extension GradientProtocol where Self: UIView {
    var defaultStartColor: UIColor {
            UIColor(red: 103.0/255.0, green: 127.0/255.0, blue: 235.0/255.0, alpha: 1)
    }
    var defaultEndColor: UIColor {
        UIColor(red: 116.0/255.0, green: 73.0/255.0, blue: 160.0/255.0, alpha: 1)
    }
    var defaultPoints: [CGPoint] {
        [CGPoint(x: 0.0, y: 0.5), CGPoint(x: 1.0, y: 0.5)]
    }
    func setDirection(_ direction: Direction) {
        gradient.startPoint = direction.points.start
        gradient.endPoint = direction.points.end
    }
    func setColors(start: UIColor, end: UIColor) {
        gradient.colors = [start.cgColor, end.cgColor]
    }
    func setupFrames() {
        gradient.frame = bounds
    }
    func defaultSetup() {
        gradient.startPoint = defaultPoints[0]
        gradient.endPoint = defaultPoints[1]
        setColors(start: defaultStartColor, end: defaultEndColor)
        layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - GRADIENT VIEW
class GradientView: UIView, GradientProtocol {
    internal let gradient = CAGradientLayer()
    private var previousBounds: CGRect = .zero
    init() {
        super.init(frame: .zero)
        defaultSetup()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds != previousBounds {
            previousBounds = bounds
            setupFrames()
        }
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - GRADIENT STACK VIEW
class GradientStackView: UIStackView, GradientProtocol {
    internal let gradient = CAGradientLayer()
    private var previousBounds: CGRect = .zero
    init() {
        super.init(frame: .zero)
        defaultSetup()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds != previousBounds {
            previousBounds = bounds
            setupFrames()
        }
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
