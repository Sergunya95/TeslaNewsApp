//
//  OneNewsViewController.swift
//  NewsApp
//
//  Created by apple on 09.10.2021.
//

import UIKit
import SafariServices

class OneNewsViewController: UIViewController {

    var index: Int = 0
    
    var article: Article!
    
    //MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lableTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var pushOpenButton: UIButton!
    
    //MARK: Actions
    @IBAction func pushOpenAction(_ sender: Any) {
        if let url = URL(string: article.url) {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lableTitle.text = article.title
        labelDescription.text = article.description
        
        DispatchQueue.main.async {
            if let url = URL(string: self.article.urlToImage) {
                if let data = try? Data(contentsOf: url) {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
}
