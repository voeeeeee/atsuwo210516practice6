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
    private var randomNum: Int  = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sliderSetUp()
        self.randomNum = Int.random(in: 1...100)
        randomNumber.text = String(self.randomNum)
    }
    @IBAction private func judgeButton(_ sender: Any) {
        if self.randomNum == Int(slider.value) {
            presentAlert(message: "あたり!" + "\n" + "あなたの値:" + String(Int(slider.value)))
            randomNumberSetUp()
        } else {
            presentAlert(message: "はずれ!" + "\n" + "あなたの値:" + String(Int(slider.value)))
            randomNumberSetUp()
        }
    }
    private func presentAlert(message: String) {
        let alert: UIAlertController = UIAlertController(title: "結果", message: message, preferredStyle: UIAlertController.Style.alert)
        let defaultAction: UIAlertAction = UIAlertAction(title: "再挑戦", style: UIAlertAction.Style.default, handler: { (_: UIAlertAction!) -> Void in
            self.randomNumber.text = String(self.randomNum)
            self.slider.value = 50
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
    private func sliderSetUp () {
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.value = 50
    }
    private func randomNumberSetUp() {
        self.randomNum = Int.random(in: 1...100)
            print(self.randomNum)
    }
}
