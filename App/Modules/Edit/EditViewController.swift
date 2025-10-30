import UIKit

protocol EditPresenterProtocol {
    // Что View вызывает в Presenter
}

class EditViewController: UIViewController {
    
    var presenter: EditPresenterProtocol!
    
    let scrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    let stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
//        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
        let spacer1 = {
            let spacer1 = UIView()
            return spacer1
        }()
    
        let eventNameView = {
           let eventNameView = UIView()
            return eventNameView
        }()
            let eventNameLabel = {
                let eventNameLabel = UILabel()
                eventNameLabel.text = "Название события"
                return eventNameLabel
            }()
            let eventNameTextField = {
                let eventNameTextField = UITextField()
                return eventNameTextField
            }()
    
        let eventDateStack = {
            let eventDateStack = UIStackView()
            eventDateStack.axis = .vertical
            return eventDateStack
        }()
            let eventDateLabel = {
                let eventDateLabel = UILabel()
                eventDateLabel.text = "Дата события"
                
                return eventDateLabel
            }()
            lazy var eventDateButton = {
                let eventDateButton = UIButton()
                eventDateButton.setTitle("30.09.2025", for: .normal)
                eventDateButton.addTarget(self, action: #selector(eventDateButtonPressed), for: .touchUpInside)
                return eventDateButton
            }()
            let eventDatePicker = {
                let eventDatePicker = UIDatePicker()
//                eventDatePicker.preferredDatePickerStyle = .compact
                eventDatePicker.preferredDatePickerStyle = .inline
                eventDatePicker.datePickerMode = .date
                return eventDatePicker
            }()
    
            let eventTypeView = {
                let eventTypeView = UIView()
                return eventTypeView
            }()
                let eventTypeLabel = {
                    let eventTypeLabel = UILabel()
                    eventTypeLabel.text = "Тип события"
                    return eventTypeLabel
                }()
                let eventTypeSegmentControll = {
                    let eventTypeSegmentControll = UISegmentedControl()
                    return eventTypeSegmentControll
                }()
        let spacer2 = {
            let spacer2 = UIView()
            return spacer2
        }()
    // MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addSubViews()
        setupConstraints()
        toPaintViews()
        
//        eventDateButton.addTarget(self, action: #selector(eventDateButtonPressed), for: .touchUpInside)
    }
    
    func addSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        [spacer1,
         eventNameView,
         eventDateStack,
         eventTypeView,
         spacer2].forEach { someView in
            stackView.addArrangedSubview(someView)
        }
        
        eventNameView.addSubview(eventNameLabel)
        eventNameView.addSubview(eventNameTextField)
        
        eventDateStack.addArrangedSubview(eventDateLabel)
        eventDateStack.addArrangedSubview(eventDateButton)
        eventDateStack.addArrangedSubview(eventDatePicker)
        
        eventTypeView.addSubview(eventTypeLabel)
        eventTypeView.addSubview(eventTypeSegmentControll)
    }
    
    func setupConstraints() {
        
        [scrollView,
            stackView,
                spacer1,
                eventNameView,
                    eventNameLabel,
                    eventNameTextField,
                eventDateStack,
                    eventDateLabel,
                    eventDateButton,
                    eventDatePicker,
                eventTypeView,
                    eventTypeLabel,
                    eventTypeSegmentControll,
                spacer2,].forEach { someView in
                    someView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            stackView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            
            
            spacer1.heightAnchor.constraint(equalToConstant: 0),
            spacer2.heightAnchor.constraint(equalToConstant: 0),
            spacer1.heightAnchor.constraint(equalTo: spacer2.heightAnchor),
            
            eventNameLabel.topAnchor.constraint(equalTo: eventNameView.topAnchor),
            eventNameLabel.leadingAnchor.constraint(equalTo: eventNameView.leadingAnchor),
            eventNameLabel.trailingAnchor.constraint(equalTo: eventNameView.trailingAnchor),
            
            eventNameTextField.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor),
            eventNameTextField.leadingAnchor.constraint(equalTo: eventNameView.leadingAnchor),
            eventNameTextField.trailingAnchor.constraint(equalTo: eventNameView.trailingAnchor),
            eventNameTextField.bottomAnchor.constraint(equalTo: eventNameView.bottomAnchor),
            eventNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            eventDateLabel.topAnchor.constraint(equalTo: eventDateStack.topAnchor),
            eventDateLabel.leadingAnchor.constraint(equalTo: eventDateStack.leadingAnchor),
            eventDateLabel.trailingAnchor.constraint(equalTo: eventDateStack.trailingAnchor),
            
            eventDateButton.topAnchor.constraint(equalTo: eventDateLabel.bottomAnchor),
            eventDateButton.leadingAnchor.constraint(equalTo: eventDateStack.leadingAnchor),
            eventDateButton.trailingAnchor.constraint(equalTo: eventDateStack.trailingAnchor),
            eventDateButton.heightAnchor.constraint(equalToConstant: 50),
            
            eventDatePicker.topAnchor.constraint(equalTo: eventDateButton.bottomAnchor),
            eventDatePicker.leadingAnchor.constraint(equalTo: eventDateStack.leadingAnchor),
            eventDatePicker.trailingAnchor.constraint(equalTo: eventDateStack.trailingAnchor),
            eventDatePicker.bottomAnchor.constraint(equalTo: eventDateStack.bottomAnchor),
            eventDatePicker.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            eventTypeLabel.topAnchor.constraint(equalTo: eventTypeView.topAnchor),
            eventTypeLabel.leadingAnchor.constraint(equalTo: eventTypeView.leadingAnchor),
            eventTypeLabel.trailingAnchor.constraint(equalTo: eventTypeView.trailingAnchor),
            
            eventTypeSegmentControll.topAnchor.constraint(equalTo: eventTypeLabel.bottomAnchor),
            eventTypeSegmentControll.leadingAnchor.constraint(equalTo: eventTypeView.leadingAnchor),
            eventTypeSegmentControll.trailingAnchor.constraint(equalTo: eventTypeView.trailingAnchor),
            eventTypeSegmentControll.bottomAnchor.constraint(equalTo: eventTypeView.bottomAnchor),
            eventTypeSegmentControll.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func toPaintViews() {
        view.backgroundColor = .systemYellow
//        scrollView.backgroundColor = .systemRed
//        stackView.backgroundColor = .systemGreen
        spacer1.backgroundColor = .systemBlue
        eventNameView.backgroundColor = .systemOrange
        eventNameLabel.backgroundColor = .systemBrown
        eventNameTextField.backgroundColor = .systemPink
        spacer2.backgroundColor = .systemPurple
        eventDateStack.backgroundColor = .systemRed
        eventDateLabel.backgroundColor = .systemGreen
        eventDateButton.backgroundColor = .systemIndigo
        eventDatePicker.backgroundColor = .systemMint
        eventTypeView.backgroundColor = .systemGray
        eventTypeLabel.backgroundColor = .systemRed
        eventTypeSegmentControll.backgroundColor = .systemGreen
        
    }
    @objc func eventDateButtonPressed() {
        UIView.animate(withDuration: 0.25) {
            self.eventDatePicker.isHidden.toggle()
//            self.view.layoutIfNeeded()
        }
    }
}

extension EditViewController: EditViewProtocol {
    // Что Presenter вызывает во View
}

@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: EditViewController())
}
