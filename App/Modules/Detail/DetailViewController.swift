import UIKit

protocol DetailPresenterProtocol {
    //  Что View вызывает в Presenter
    var view: DetailViewProtocol? { get set }
    var interactor: InteractorProtocol! { get set }
    var router: RouterProtocol! { get set }
}

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol!
    // TODO: - DELETE DATA
    // MARK: - DATA:
    let upStackLabelsData: [String] = {
        let count = "42"
        let name = "Концерт Metallica"
        let date = "15 августа 2025"
        return [count, name, date]
    }()
    
    // MARK: - PROPERTIES
    let scroll: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
//        stack.spacing = 16
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        return stack
    }()
    // MARK: - UP STACK
    let upStack: GradientStackView = {
        let upStack = GradientStackView(withDirection: .topLeftToBottomRight)
        upStack.axis = .vertical
        upStack.distribution = .fillProportionally
        upStack.alignment = .center
        upStack.isLayoutMarginsRelativeArrangement = true
        upStack.layoutMargins = UIEdgeInsets(top: 24, left: 0, bottom: 36, right: 0)
        return upStack
    }()
    let upStackLabels: [UILabel] = {
        let count = UILabel()
        let name = UILabel()
        let date = UILabel()
        [count, name, date].forEach { label in
            label.textColor = .white
        }
        count.font = .systemFont(ofSize: 100, weight: .bold)
        name.font = .systemFont(ofSize: 28, weight: .bold)
        date.font = .systemFont(ofSize: 20)
        date.textColor = .systemGray5
        return [count, name, date]
    }()
//    let gradient4UpStack: CAGradientLayer = {
//        let gradient = CAGradientLayer()
//        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
//        // sRGB:
//        let upperLeftCornerColor = UIColor(red: 103.0/255.0, green: 127.0/255.0, blue: 235.0/255.0, alpha: 1)
//        let lowerRightCornerColor = UIColor(red: 116.0/255.0, green: 73.0/255.0, blue: 160.0/255.0, alpha: 1)
//        let colors = [upperLeftCornerColor.cgColor, lowerRightCornerColor.cgColor]
//        gradient.colors = colors
////        gradient.needsDisplayOnBoundsChange = true
//        return gradient
//    }()
    // MARK: - MID STACK
    let midStack: UIStackView = {
        let midStack = UIStackView()
        midStack.axis = .vertical
//        midStack.backgroundColor = .systemRed
        midStack.distribution = .fillEqually
        midStack.isLayoutMarginsRelativeArrangement = true
        midStack.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 12, right: 24)
        return midStack
    }()
    let midStackUp: UIStackView = {
        let midStackUp = UIStackView()
//        midStackUp.backgroundColor = .systemBlue
        midStackUp.distribution = .fillEqually
        midStackUp.isLayoutMarginsRelativeArrangement = true
        midStackUp.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 9, right: 0)
        midStackUp.spacing = 18
        return midStackUp
    }()
    let midStackUpLabels: [UILabel] = {
       let label0 = UILabel()
        let label1 = UILabel()
        [label0, label1].forEach { label in
            label.textAlignment = .center
            label.backgroundColor = .systemGray6
            label.clipsToBounds = true
            label.layer.cornerRadius = 16
        }
        return [label0, label1]
    }()
    let midStackDown: UIStackView = {
        let midStackDown = UIStackView()
//        midStackDown.backgroundColor = .blue
        midStackDown.distribution = .fillEqually
        midStackDown.isLayoutMarginsRelativeArrangement = true
        midStackDown.layoutMargins = UIEdgeInsets(top: 9, left: 0, bottom: 0, right: 0)
        midStackDown.spacing = 18
        return midStackDown
    }()
    let midStackDownLabels: [UILabel] = {
       let label0 = UILabel()
        let label1 = UILabel()
        [label0, label1].forEach { label in
            label.textAlignment = .center
            label.backgroundColor = .systemGray6
            label.clipsToBounds = true
            label.layer.cornerRadius = 16
        }
        return [label0, label1]
    }()
    // MARK: - DOWN VIEW
    let downView: UIView = {
        let downView = UIView()
//        downView.backgroundColor = .systemOrange
        return downView
    }()
    let downViewStack: UIStackView = {
        let downViewStack = UIStackView()
//        downViewStack.backgroundColor = .black
        return downViewStack
    }()
    let downViewStackLabels: [UILabel] = {
        let label0 = UILabel()
        let label1 = UILabel()
        label0.textColor = .gray
        label0.font = .boldSystemFont(ofSize: 20)
        label1.textColor = .black
        label1.font = .boldSystemFont(ofSize: 23)
        return [label0, label1]
    }()
    let downViewProgress: UIProgressView = {
        let downViewProgress = UIProgressView()
//        downViewProgress.backgroundColor = .black
        downViewProgress.progressViewStyle = .default
        downViewProgress.progressTintColor = UIColor(red: 58.0/255.0, green: 156.0/255.0, blue: 136.0/255.0, alpha: 1)
        downViewProgress.trackTintColor = UIColor(red: 223.0/255.0, green: 223.0/255.0, blue: 225.0/255.0, alpha: 1)
        return downViewProgress
    }()
    // MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        setupConstraints()
        setValues() // TODO: - DELETE
        
        
//        Task {
//            try? await Task.sleep(nanoseconds: 3_000_000_000) // 3 секунды
//            print("Прошло 3 секунды, запускаем задачу")
//            await changeColorOfGradient()
//        }
    }
//    func changeColorOfGradient() async {
//        upStack.changeDirectionOn(.bottomLeftToTopRight)
//    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upStack.layoutIfNeeded()
//        gradient4UpStack.frame = upStack.bounds
    }
    // MARK: - METHODS
    func addSubviews() {
        view.addSubview(scroll)
        scroll.addSubview(stack)
        stack.addArrangedSubview(upStack)
        stack.addArrangedSubview(midStack)
        stack.addArrangedSubview(downView)
        
//        upStack.layer.insertSublayer(gradient4UpStack, at: 0)
        upStack.addArrangedSubview(upStackLabels[0])
        upStack.addArrangedSubview(upStackLabels[1])
        upStack.addArrangedSubview(upStackLabels[2])
        
        midStack.addArrangedSubview(midStackUp)
        midStack.addArrangedSubview(midStackDown)
        midStackUp.addArrangedSubview(midStackUpLabels[0])
        midStackUp.addArrangedSubview(midStackUpLabels[1])
        midStackDown.addArrangedSubview(midStackDownLabels[0])
        midStackDown.addArrangedSubview(midStackDownLabels[1])
        
        downView.addSubview(downViewStack)
        downView.addSubview(downViewProgress)
        downViewStack.addArrangedSubview(downViewStackLabels[0])
        downViewStack.addArrangedSubview(downViewStackLabels[1])
    }
    // MARK: - CONSTRAINTS
    func setupConstraints() {
        [scroll, stack, upStack, midStack, downView, downViewStack, downViewProgress].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stack.topAnchor.constraint(equalTo: scroll.topAnchor),
            stack.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            stack.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            stack.bottomAnchor.constraint(greaterThanOrEqualTo: scroll.bottomAnchor),
            stack.heightAnchor.constraint(greaterThanOrEqualTo: scroll.heightAnchor),

            upStack.heightAnchor.constraint(equalToConstant: 250),
            midStack.heightAnchor.constraint(equalToConstant: 230),
            downView.heightAnchor.constraint(equalToConstant: 110),
            
            downViewStack.heightAnchor.constraint(equalToConstant: 60),
            downViewStack.leadingAnchor.constraint(equalTo: downView.leadingAnchor, constant: 24),
            downViewStack.trailingAnchor.constraint(equalTo: downView.trailingAnchor, constant: -24),
            
            downViewProgress.topAnchor.constraint(equalTo: downViewStack.bottomAnchor, constant: 8),
            downViewProgress.leadingAnchor.constraint(equalTo: downView.leadingAnchor, constant: 24),
            downViewProgress.trailingAnchor.constraint(equalTo: downView.trailingAnchor, constant: -24)
        ])
    }
    func setValues() {
        setValues4UpStackLabels()
        setValues4MidStackLabels()
        setValues4DownViewStack()
        
        func setValues4UpStackLabels() {
            for i in 0...2 {
                upStackLabels[i].text = upStackLabelsData[i]
            }
        }
        func setValues4MidStackLabels() {
            let midStackLabels = [midStackUpLabels[0], midStackUpLabels[1], midStackDownLabels[0], midStackDownLabels[1]]
            midStackLabels.forEach { $0.numberOfLines = 0 }
            midStackUpLabels[0].attributedText = makeTwoLineAttributedText(title: "6\n", subtitle: "недель")
            midStackUpLabels[1].attributedText = makeTwoLineAttributedText(title: "1.4\n", subtitle: "месяца")
            midStackDownLabels[0].attributedText = makeTwoLineAttributedText(title: "1008\n", subtitle: "часов")
            midStackDownLabels[1].attributedText = makeTwoLineAttributedText(title: "60480\n", subtitle: "минут")
            
            func makeTwoLineAttributedText(title: String, subtitle: String) -> NSMutableAttributedString {
                
                let attributedText = NSMutableAttributedString(string: title + subtitle)
                // Настраваем первую строку
                attributedText.addAttributes([
                    .font: UIFont.boldSystemFont(ofSize: 32),
                    .foregroundColor: UIColor.label
                ], range: NSRange(location: 0, length: title.count))
                // Настраваем вторую строку
                attributedText.addAttributes([
                    .font: UIFont.boldSystemFont(ofSize: 18),
                    .foregroundColor: UIColor.gray
                ], range: NSRange(location: title.count, length: subtitle.count))
                
                return attributedText
            }
        }
        func setValues4DownViewStack() {
            downViewStackLabels[0].text = "Прогресс ожидания"
            downViewStackLabels[1].text = "65%"
            downViewProgress.progress = 0.65
        }
    }
}
// MARK: - GRADIENT VIEW
class GradientView: UIView {
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
    private let gradient = CAGradientLayer()
    
    private var startPoint: CGPoint {
        didSet {
            gradient.startPoint = startPoint
        }
    }
    private var endPoint: CGPoint {
        didSet {
            gradient.endPoint = endPoint
        }
    }
    // sRGB:
    private var startColor: UIColor  {
        didSet {
            gradient.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    private var endColor: UIColor {
        didSet {
            gradient.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    func changeDirectionOn(_ direction: Direction) {
        startPoint = direction.points.start
        endPoint = direction.points.end
    }
    func changeColor(startWithSRGBcolor startColor: UIColor, endWithSRGBcolor endColor: UIColor) {
        self.startColor = startColor
        self.endColor = endColor
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
    init(withDirection direction: Direction = .leftToRight) {
        startPoint = direction.points.start
        endPoint = direction.points.end
        
        startColor = UIColor(red: 103.0/255.0, green: 127.0/255.0, blue: 235.0/255.0, alpha: 1)
        endColor = UIColor(red: 116.0/255.0, green: 73.0/255.0, blue: 160.0/255.0, alpha: 1)
        
        super.init(frame: .zero)
        setup()
    }
    func setup() {
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - GRADIENT STACK VIEW
class GradientStackView: UIStackView {
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
    private let gradient = CAGradientLayer()
    
    private var startPoint: CGPoint {
        didSet {
            gradient.startPoint = startPoint
        }
    }
    private var endPoint: CGPoint {
        didSet {
            gradient.endPoint = endPoint
        }
    }
    // sRGB:
    private var startColor: UIColor  {
        didSet {
            gradient.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    private var endColor: UIColor {
        didSet {
            gradient.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    func changeDirectionOn(_ direction: Direction) {
        startPoint = direction.points.start
        endPoint = direction.points.end
    }
    func changeColor(startWithSRGBcolor startColor: UIColor, endWithSRGBcolor endColor: UIColor) {
        self.startColor = startColor
        self.endColor = endColor
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
    init(withDirection direction: Direction = .leftToRight) {
        startPoint = direction.points.start
        endPoint = direction.points.end
        
        startColor = UIColor(red: 103.0/255.0, green: 127.0/255.0, blue: 235.0/255.0, alpha: 1)
        endColor = UIColor(red: 116.0/255.0, green: 73.0/255.0, blue: 160.0/255.0, alpha: 1)
        
        super.init(frame: .zero)
        setup()
    }
    func setup() {
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        layer.insertSublayer(gradient, at: 0)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailViewController: DetailViewProtocol {
    //  Что Presenter вызывает в View
    func updateValues() {
        // ...
    }
}

@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: DetailViewController())
}
