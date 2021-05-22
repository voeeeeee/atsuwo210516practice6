//
//  ViewController.swift
//  practice6
//
//  Created by 竹辻篤志 on 2021/05/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var randomNumber: UILabel!
    @IBOutlet private weak var slider: UISlider!

    private var randomNum: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSlider()
        resetGame()
    }

    @IBAction private func judgeButton(_ sender: Any) {
        let firstLine: String
        if randomNum == Int(slider.value) {
            firstLine = "あたり!"
        } else {
            firstLine = "はずれ!"
        }

        presentAlert(message: "\(firstLine)\nあなたの値: \(Int(slider.value))")
    }

    private func presentAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)

        let defaultAction = UIAlertAction(
            title: "再挑戦",
            style: .default,
            handler: { [weak self] _ in
                self?.resetGame()
            }
        )

        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }

    private func setupSlider () {
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.value = 50
    }

    private func resetGame() {
        randomNum = Int.random(in: 1...100)
        randomNumber.text = String(randomNum)
        slider.value = 50
    }
}
