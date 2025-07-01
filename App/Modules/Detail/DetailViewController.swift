import UIKit

protocol DetailPresenterProtocol {
    //  Что View вызывает в Presenter
    var view: DetailViewProtocol? { get set }
    var interactor: InteractorProtocol! { get set }
    var router: RouterProtocol! { get set }
}
enum forMainView {
    case count
    case name
    case date
}
class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol!
    // TODO: - DELETE DATA
    // MARK: - DATA:
    var upStackLabelsData: [forMainView: String] = {
        let count = "count"
        let name = "name"
        let date = "date"
        return [.count: count, .name: name, .date: date]
    }()
    
    // MARK: - PROPERTIES
    var scroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBlue
        return scrollView
    }()
    var stack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    var upStack: UIStackView = {
        let view = UIStackView()
        return view
    }()
    var upStackLabels: [forMainView: UILabel] = {
        let count = UILabel()
        let name = UILabel()
        let date = UILabel()
        return [.count: count, .name: name, .date: date]
    }()
    var gradient4UpStack: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        // sRGB:
        let upperLeftCornerColor = UIColor(red: 103.0/255.0, green: 127.0/255.0, blue: 235.0/255.0, alpha: 1)
        let lowerRightCornerColor = UIColor(red: 116.0/255.0, green: 73.0/255.0, blue: 160.0/255.0, alpha: 1)
        let colors = [upperLeftCornerColor.cgColor, lowerRightCornerColor.cgColor]
        gradient.colors = colors
//        gradient.needsDisplayOnBoundsChange = true
        return gradient
    }()
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upStack.layoutIfNeeded()
        gradient4UpStack.frame = upStack.bounds
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    // MARK: - METHODS
    func addSubviews() {
        view.addSubview(scroll)
        scroll.addSubview(stack)
        stack.addArrangedSubview(upStack)
        upStackLabels.forEach { _, label in
            upStack.addArrangedSubview(label)
        }
        upStack.layer.insertSublayer(gradient4UpStack, at: 0)
        
        upStackLabels[.count]
    }
    func setupConstraints() {
        [scroll, stack, upStack].forEach {
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
            stack.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),

            upStack.heightAnchor.constraint(equalToConstant: 250)
        ])
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
