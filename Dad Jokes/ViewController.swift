
//import UIKit
//
//class ViewController: UIViewController {
//    
//    let setupLabel = UILabel()
//    let punchlineLabel = UILabel()
//    let continueLabel = UILabel()
//    let whatButton = UIButton(type: .system)
//    
//    var index = 0
//    
//    let screenTapGesture = UITapGestureRecognizer()
//            
//    
//    let stackView = UIStackView()
//    
//    let jokesArray = [
//        Joke(
//            setup: "Why did the developer go broke?",
//            punchline: "Because he used up all his cache!"
//        ),
//        Joke(
//            setup: "What's the object-oriented way to become wealthy?",
//            punchline: "Inheritance!"
//        ),
//        Joke(
//            setup: "Why do programmers wear glasses?",
//            punchline: "Because they can't C#!"
//        ),
//    ]
//    
//    
//    // ------------------------------------------------------
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//        setupLayout()
//    }
//
//    // ------------------------------------------------------
//    private func setupUI() {
//        view.backgroundColor = .systemBackground
//        
//        setupLabel.text = jokesArray[index].setup
//        setupLabel.font = .preferredFont(forTextStyle: .title1)
//        setupLabel.textAlignment = .center
//        // setupLabel.font = .systemFont(ofSize: 25, weight: .bold)
//        setupLabel.numberOfLines = 0
//        
//        whatButton.setTitle("What?", for: .normal)
//        whatButton.setTitleColor(.white, for: .normal)
//        whatButton.backgroundColor = .blue
//        whatButton.layer.cornerRadius = 20
//        whatButton.addTarget(self, action: #selector(whatTapped), for: .touchUpInside)
//        
//        punchlineLabel.text = jokesArray[index].punchline
//        punchlineLabel.textColor = .red
//        punchlineLabel.font = .preferredFont(forTextStyle: .title2)
//        punchlineLabel.numberOfLines = 0
//        punchlineLabel.isHidden = true
//        
//        continueLabel.text = "Tap anywhere for more!"
//        continueLabel.textColor = .black
//        continueLabel.font = .preferredFont(forTextStyle: .body)
//        continueLabel.numberOfLines = 0
//        continueLabel.isHidden = true
//        
//        screenTapGesture.addTarget(self, action: #selector(handleTapAnywhere))
//        screenTapGesture.isEnabled = false
//        
//        stackView.axis = .vertical
//        stackView.alignment = .center
//        stackView.spacing = 25
//        
//        stackView.addArrangedSubview(setupLabel)
//        stackView.addArrangedSubview(whatButton)
//        stackView.addArrangedSubview(punchlineLabel)
//        //stack.addArrangedSubview(continueLabel)
//        
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        continueLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(stackView)
//        view.addSubview(continueLabel)
//        view.addGestureRecognizer(screenTapGesture)
//        
//    }
//    
//    // ------------------------------------------------------
//    private func setupLayout() {
//        NSLayoutConstraint.activate([
//            
//            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
//            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
//            
//            //stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            
//            whatButton.widthAnchor.constraint(equalToConstant: 150),
//            whatButton.heightAnchor.constraint(equalToConstant: 50),
//            
//            continueLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            continueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        ])
//    }
//    
//    
//    
//    // ------------------------------------------------------
//    @objc private func whatTapped() {
//        punchlineLabel.isHidden = false
//        continueLabel.isHidden = false
//        
//        showAlert()
//        
//        screenTapGesture.isEnabled = true
//              
//    }
//    
//    
//    @objc private func handleTapAnywhere(_ sender: UITapGestureRecognizer) {
//        //continueLabel.isHidden = true
//        
//        index += 1
//        
//        if index >= jokesArray.count {
//            index = 0
//        }
//        
//        updateUI()
//    }
//    
//    @objc private func updateUI() {
//        setupLabel.text = jokesArray[index].setup
//        punchlineLabel.text = jokesArray[index].punchline
//        punchlineLabel.isHidden = true
//        continueLabel.isHidden = true
//        screenTapGesture.isEnabled = false
//    }
//    
//    @objc private func showAlert() {
//        let alert = UIAlertController(
//            title: "Did you laugh?",
//            message: "Let us know!",
//            preferredStyle: .alert
//        )
//        
//        let yesAction = UIAlertAction(title: "Yes HAHA", style: .default) { _ in
//            print("Positive \(self.index)")
//        }
//        
////        alert.addAction(UIAlertAction(
////            title: NSLocalizedString("OK", comment: "Default action"),
////            style: .default,
////            handler: { _ in
////                NSLog("The 'OK' alert occurred.")
////            }
////        ))
//        
//        let noAction = UIAlertAction(title: "No...", style: .destructive) { _ in
//            print("Negative \(self.index)")
//        }
//        
//        alert.addAction(yesAction)
//        alert.addAction(noAction)
//        
//        self.present(alert, animated: true, completion: nil)
//        
//    }
//}
//
//
//#Preview {
//    ViewController()
//}
//
