
//
//  JokesViewController.swift
//  Dad Jokes
//

import UIKit

final class JokesViewController: UIViewController, JokesViewProtocol {

    var presenter: JokesPresenterProtocol?

    private let setupLabel = UILabel()
    private let punchlineLabel = UILabel()
    private let continueLabel = UILabel()
    private let whatButton = UIButton(type: .system)
    private let stackView = UIStackView()
    private let screenTapGesture = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        presenter?.viewDidLoad()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        setupLabel.font = .preferredFont(forTextStyle: .title1)
        setupLabel.textAlignment = .center
        setupLabel.numberOfLines = 0

        whatButton.setTitle("What?", for: .normal)
        whatButton.setTitleColor(.white, for: .normal)
        whatButton.backgroundColor = .blue
        whatButton.layer.cornerRadius = 20
        whatButton.addTarget(self, action: #selector(whatTapped), for: .touchUpInside)

        punchlineLabel.textColor = .red
        punchlineLabel.font = .preferredFont(forTextStyle: .title2)
        punchlineLabel.numberOfLines = 0
        punchlineLabel.isHidden = true

        continueLabel.text = "Tap anywhere for more!"
        continueLabel.font = .preferredFont(forTextStyle: .body)
        continueLabel.isHidden = true

        screenTapGesture.addTarget(self, action: #selector(handleTapAnywhere))
        screenTapGesture.isEnabled = false

        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 25
        stackView.addArrangedSubview(setupLabel)
        stackView.addArrangedSubview(whatButton)
        stackView.addArrangedSubview(punchlineLabel)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        continueLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)
        view.addSubview(continueLabel)
        view.addGestureRecognizer(screenTapGesture)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            whatButton.widthAnchor.constraint(equalToConstant: 150),
            whatButton.heightAnchor.constraint(equalToConstant: 50),

            continueLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            continueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

    @objc private func whatTapped() {
        presenter?.didTapShowPunchline()
    }

    @objc private func handleTapAnywhere() {
        presenter?.didTapNext()
    }

    // MARK: - JokesViewProtocol

    func showJoke(setup: String, punchline: String, isPunchlineVisible: Bool) {
        setupLabel.text = setup
        punchlineLabel.text = punchline
        punchlineLabel.isHidden = !isPunchlineVisible
        continueLabel.isHidden = !isPunchlineVisible
        screenTapGesture.isEnabled = isPunchlineVisible
    }

    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

#Preview {
    JokesRouter.createModule()
}
