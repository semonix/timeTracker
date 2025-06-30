import UIKit

protocol DetailPresenterProtocol {
    //  Что View вызывает в Presenter
    var view: DetailViewProtocol? { get set }
    var interactor: InteractorProtocol! { get set }
    var router: RouterProtocol! { get set }
}

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol!
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBlue
        return scrollView
    }()
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .systemCyan
        return stackView
    }()
//    lazy var layer: CAGradientLayer = {
//        let gradient = CAGradientLayer()
//        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
//        
//        let upperLeftCornerColor = UIColor(red: 107.0/255.0, green: 125.0/255.0, blue: 226.0/255.0, alpha: 1)
//        let lowerRightCornerColor = UIColor(red: 109.0/255.0, green: 75.0/255.0, blue: 154.0/255.0, alpha: 1)
//        let colors = [upperLeftCornerColor.cgColor, lowerRightCornerColor.cgColor]
//        gradient.colors = colors
//        
//        
//        gradient.cornerRadius = 12
//        return gradient
//    }()
    lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        
//        self.view.layer.insertSublayer(self.layer, at: 0)
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addSubviews()
        setupConstraints()
    }
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(mainView)
    }
    func setupConstraints() {
        [scrollView, stackView, mainView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            mainView.heightAnchor.constraint(equalToConstant: 700)
        ])
//        layer.frame = mainView.bounds
    }
}

extension DetailViewController: DetailViewProtocol {
    //  Что Presenter вызывает в View
}

@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: DetailViewController())
}

//func applyGradient(_ colors: [CGColor], frame: CGRect) {
//    let gradient = CAGradientLayer()
//    gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
//    gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
//    gradient.colors = colors
//    gradient.frame = frame
//    gradient.cornerRadius = 12
//    contentView.layer.insertSublayer(gradient, at: 0)
//}
