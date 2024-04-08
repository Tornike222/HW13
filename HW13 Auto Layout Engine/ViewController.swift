//
//  ViewController.swift
//  HW13 Auto Layout Engine
//
//  Created by telkanishvili on 05.04.24.
//

import UIKit

//MARK: Object
var capuccino = Coffe(productName: "კაპუჩინო", reviewCount: 230, smallCoffeePrice: 3.40)


class ViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var bottomBuyView: UIView!
    @IBOutlet weak var coffeImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var bigCoffee: UIButton!
    @IBOutlet weak var mediumCoffee: UIButton!
    @IBOutlet weak var smallCoffee: UIButton!
    @IBOutlet weak var costOfCoffee: UILabel!
    var isOn = false
    
    //MARK: Override

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coffeImage.layer.cornerRadius = 20
        bottomBuyView.layer.cornerRadius = 20
        bottomBuyView.layer.shadowOpacity = 0.1
        bottomBuyView.layer.shadowColor = UIColor.lightGray.cgColor
        reviewCount.text = "(\(capuccino.reviewCount))"
    }
    
    //MARK: Actions
    @IBAction func chooseSmallCoffee(_ sender: UIButton) {
        activate(option: smallCoffee)
        deactivateActivated(option: mediumCoffee)
        deactivateActivated(option: bigCoffee)
        costOfCoffee.text = "₾ \(capuccino.smallCoffeePrice)"
    }
    
    @IBAction func chooseMediumCoffee(_ sender: UIButton) {
        activate(option: mediumCoffee)
        deactivateActivated(option: smallCoffee)
        deactivateActivated(option: bigCoffee)
        costOfCoffee.text = "₾ \(capuccino.mediumCoffeePrice)"
    }
    
    @IBAction func chooseBigCoffee(_ sender: Any) {
        activate(option: bigCoffee)
        deactivateActivated(option: mediumCoffee)
        deactivateActivated(option: smallCoffee)
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
    
    //MARK: Methods
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


