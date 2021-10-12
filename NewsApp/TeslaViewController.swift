//
//  TeslaViewController.swift
//  NewsApp
//
//  Created by apple on 10.10.2021.
//


import UIKit
import SafariServices

class TeslaViewController: UIViewController {

    var segmentControl = UISegmentedControl()
    var imageView = UIImageView()
    var button = UIButton()
    let topLabel = UILabel()
    let myLabel = UILabel()
    let specLabel = UILabel()
    
    
    let urlArray = ["https://www.tesla.com/models/design#overview",
                    "https://www.tesla.com/model3/design#overview",
                    "https://www.tesla.com/modelx/design#overview",
                    "https://www.tesla.com/modely/design#overview"]
    
    let colorArray = ["🔵", "⚫️", "🔘", "🔴", "⚪️"]
    let imageModelsArray = [UIImage(named: "sb"),
                            UIImage(named: "3r"),
                            UIImage(named: "xw"),
                            UIImage(named: "ybl"),
    ]
    let imageArray3 = [UIImage(named: "3b"),
                       UIImage(named: "3bl"),
                       UIImage(named: "3g"),
                       UIImage(named: "3r"),
                       UIImage(named: "3w")]
    
    let imageArrayS = [UIImage(named: "sb"),
                       UIImage(named: "sbl"),
                       UIImage(named: "sg"),
                       UIImage(named: "sr"),
                       UIImage(named: "sw")]
    
    let modelArray = ["S", "3", "X", "Y"]
    
    let modelDescriptionArray = [
"""
Model S Plaid
0-60 mph - 1.99sec
Top Speed - 200 mph
Range - 348mi
1/4 mile: 9.23@155 mph trap speed
1,020 horsepower
Three high performance motors
with carbon-sleeved rotors
Price from - $123,740
""",
"""
Model 3 Performance
0-60 mph - 3.1sec
Top Speed - 162 mph
Range - 315mi
Dual Motor All-Wheel Drive
Price from - $52,940
""",
"""
Model X Plaid
0-60 mph - 2.5sec
Top Speed - 163 mph
Range - 340mi
1/4 mile: 9.9s
1,020 horsepower
Three high performance motors
with carbon-sleeved rotors
Price from - $113,940
""",
"""
Model Y Performance
0-60 mph - 3.5sec
Top Speed - 155 mph
Range - 303mi
Dual Motor All-Wheel Drive
Price from - $56,940
"""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTopLabel()
        createImage()
        // createColorSegmentControl()
        createModelSC()
        createDescriptionLabel()
        createSpecLabel()
        createButton()
        
    }
    
    func createTopLabel() {
        let labelFrame = CGRect(x: 50, y: 20, width: 300, height: 100)
        
        topLabel.frame = labelFrame
        topLabel.text = "Choose your Tesla"
        topLabel.font = UIFont.boldSystemFont(ofSize: 33)
        view.addSubview(topLabel)
    }
    
    func createDescriptionLabel() {
        let labelFrame = CGRect(x: 50, y: 385, width: 300, height: 225)
        
        myLabel.frame = labelFrame
        myLabel.numberOfLines = 10
        myLabel.text = "\(modelDescriptionArray[0])"
       // myLabel.center = self.view.center
        myLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(myLabel)
        
    }
    
    func createSpecLabel() {
        let labelFrame = CGRect(x: 50, y: 300, width: 200, height: 150)
        
        specLabel.frame = labelFrame
        specLabel.text = "Specifications"
        specLabel.font = UIFont.boldSystemFont(ofSize: 23)
        view.addSubview(specLabel)
        
    }
    
    func createImage() {
        self.imageView.frame = CGRect(x: 8, y: 190, width: 360, height: 158)
        self.imageView.image = self.imageModelsArray[0]
        self.view.addSubview(self.imageView)
    }
    
    func createModelSC() {
        self.segmentControl = UISegmentedControl(items: self.modelArray)
        self.segmentControl.backgroundColor = .none
        self.segmentControl.frame = CGRect(x: 40, y: 110, width: 300, height: 30)
        self.view.addSubview(self.segmentControl)
        
        self.segmentControl.addTarget(self, action: #selector(selectedModelValue), for: .valueChanged)
    }
    @objc func selectedModelValue(target: UISegmentedControl) {
        if target == self.segmentControl {
            let segmentedIndex = target.selectedSegmentIndex
            
            self.imageView.image = self.imageModelsArray[segmentedIndex]
            self.myLabel.text = self.modelDescriptionArray[segmentedIndex]
        }
    }
    
    func createButton() {
        button.frame = CGRect(x: 140, y: 620, width: 100, height: 30)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.setTitle("Buy now", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buyButton), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buyButton(sender: UIButton) {
        let segmentedIndex = self.segmentControl.selectedSegmentIndex
        if let url = URL(string: urlArray[segmentedIndex] ) {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    
    /* func createColorSegmentControl() {
         self.segmentControl = UISegmentedControl(items: self.colorArray)
         self.segmentControl.frame = CGRect(x: 40, y: 350, width: 300, height: 30)
         self.view.addSubview(self.segmentControl)
         
         self.segmentControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
     }

     @objc func selectedValue(target: UISegmentedControl) {
         if target == self.segmentControl {
             let segmentedIndex = target.selectedSegmentIndex
             
             self.imageView.image = self.imageArray3[segmentedIndex]
         }
     } */
}
