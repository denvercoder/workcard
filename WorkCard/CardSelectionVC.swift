//
//  ViewController.swift
//  WorkCard
//
//  Created by Denver Coder on 9/22/20.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView = UIImageView()
    let workoutButton = CWButton(backgroundColor: .systemRed, title: "Next Workout")
    let startOverButton = CWButton(backgroundColor: .systemGreen, title: "Start Over")
    let rulesButton = CWButton(backgroundColor: .systemBlue, title: "Rules")
    
    var cards: [UIImage] = CardDeck.allValues

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI() {
        configureCardImageView()
        configureWorkoutButton()
        configureStartOverButton()
        configureRulesButton()
    }
    
    
    @objc func resetWorkout() {
        cards = CardDeck.allValues
        cardImageView.image = UIImage(named: "JK")
    }
    
    
    @objc func showRandomCard() {
        cards.shuffle()
        cardImageView.image = cards.last
        if (cards.count > 0) {
            cards.removeLast()
        } else {
            cardImageView.image = UIImage(named: "DONE")
        }
        
    }
    
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "JK")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureWorkoutButton() {
        view.addSubview(workoutButton)
        workoutButton.addTarget(self, action: #selector(showRandomCard), for: .touchUpInside)
        NSLayoutConstraint.activate([
            workoutButton.widthAnchor.constraint(equalToConstant: 260),
            workoutButton.heightAnchor.constraint(equalToConstant: 50),
            workoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            workoutButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureStartOverButton() {
        view.addSubview(startOverButton)
        startOverButton.addTarget(self, action: #selector(resetWorkout), for: .touchUpInside )
        NSLayoutConstraint.activate([
            startOverButton.widthAnchor.constraint(equalToConstant: 115),
            startOverButton.heightAnchor.constraint(equalToConstant: 50),
            startOverButton.leadingAnchor.constraint(equalTo: workoutButton.leadingAnchor),
            startOverButton.topAnchor.constraint(equalTo: workoutButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: workoutButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: workoutButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
}
