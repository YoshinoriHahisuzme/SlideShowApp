//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Yoshinori Hashizume on 2025/04/04.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var slideShowButton: UIButton!
    
    
    var nowIndex: Int = 0
    
    var timer: Timer!
    
    var imageArray:[UIImage] = [
        UIImage(named: "柴田康広.jpg")!,
        UIImage(named: "松谷薫.jpg")!,
        UIImage(named: "朝岡稚登.jpg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = imageArray[nowIndex]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        self.slideShowButton(slideShowButton!)
        
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        resultViewController.image = imageView.image!
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        nowIndex += 1
        if nowIndex >= imageArray.count {
            nowIndex = 0
        }
        
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func backButton(_ sender: Any) {
        nowIndex -= 1
        if nowIndex < 0 {
            nowIndex = imageArray.count - 1
        }
        
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func slideShowButton(_ sender: Any) {
        
        if timer == nil {
            nextButton.isEnabled = false
            backButton.isEnabled = false
            
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextButton(_:)), userInfo: nil, repeats: true)
            slideShowButton.setTitle("停止", for: .normal)
        } else {
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
            timer.invalidate()
            timer = nil
            slideShowButton.setTitle("再生", for: .normal)
        }
    }

    @IBAction func unwind(_ sender: UIStoryboardSegue) {
        
    }
}

