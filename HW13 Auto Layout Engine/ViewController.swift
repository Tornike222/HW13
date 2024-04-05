//
//  ViewController.swift
//  HW13 Auto Layout Engine
//
//  Created by telkanishvili on 05.04.24.
//

import UIKit

struct Coffe {
    let productName: String
    var reviewCount: Int
    var smallCoffeePrice: Double
    var mediumCoffeePrice: Double {
        get {
            return smallCoffeePrice + 1.14
        }
    }
    var bigCoffeePrice: Double {
        get {
            return smallCoffeePrice + 3.25
        }
    }
}

var capuccino = Coffe(productName: "კაპუჩინო", reviewCount: 230, smallCoffeePrice: 3.40)


class ViewController: UIViewController {

    @IBOutlet weak var bottomBuyView: UIView!
    @IBOutlet weak var coffeImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var thirdOption: UIButton!
    @IBOutlet weak var secondOption: UIButton!
    @IBOutlet weak var firstOption: UIButton!
    @IBOutlet weak var costOfCoffee: UILabel!
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coffeImage.layer.cornerRadius = 20
        bottomBuyView.layer.cornerRadius = 20
        bottomBuyView.layer.shadowOpacity = 0.1
        bottomBuyView.layer.shadowColor = UIColor.lightGray.cgColor
        reviewCount.text = "(\(capuccino.reviewCount))"
    }
    
    @IBAction func firstOptionAction(_ sender: UIButton) {
        activate(option: firstOption)
        deactivateActivated(option: secondOption)
        deactivateActivated(option: thirdOption)
        costOfCoffee.text = "₾ \(capuccino.smallCoffeePrice)"
    }
    
    @IBAction func secondOptionAction(_ sender: UIButton) {
        activate(option: secondOption)
        deactivateActivated(option: firstOption)
        deactivateActivated(option: thirdOption)
        costOfCoffee.text = "₾ \(capuccino.mediumCoffeePrice)"
    }
    
    @IBAction func thirdOptionAction(_ sender: Any) {
        activate(option: thirdOption)
        deactivateActivated(option: secondOption)
        deactivateActivated(option: firstOption)
        costOfCoffee.text = "₾ \(capuccino.bigCoffeePrice)"

    }
    @IBAction func favoriteButtonAction(_ sender: UIButton) {
        if !isOn {
            let imageIcon = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
            favoriteButton.setImage(imageIcon, for: .normal)
            capuccino.reviewCount += 1
            reviewCount.text = "(\(capuccino.reviewCount))"
            isOn = true
        } else {
            favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            capuccino.reviewCount -= 1
            reviewCount.text = "(\(capuccino.reviewCount))"
            isOn = false
        }
    }
    
    
    func activate(option: UIButton){
        option.layer.backgroundColor = UIColor(red: 253.0/255.0, green: 245.0/255.0, blue: 239.0/255.0, alpha: 1.0).cgColor
        option.layer.opacity = 1.5
        option.layer.cornerRadius = 13
        option.layer.borderColor = UIColor(red: 188/255.0, green: 127/255.0, blue: 86/255.0, alpha: 1.0).cgColor
        option.layer.borderWidth = 1
        option.configuration?.baseForegroundColor = UIColor(red: 188/255.0, green: 127/255.0, blue: 86/255.0, alpha: 1.0)
    }
    
    func deactivateActivated(option: UIButton){
        option.layer.borderWidth = 0
        option.configuration?.baseForegroundColor = .darkText
        option.layer.backgroundColor = UIColor.white.cgColor
    }
    
    
    

}


