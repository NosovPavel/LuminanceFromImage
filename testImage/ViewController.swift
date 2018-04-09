//
//  ViewController.swift
//  testImage
//
//  Created by Pavel Nosov on 09/04/2018.
//  Copyright © 2018 Rarus. All rights reserved.
//

import UIKit
import GPUImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getLuminosity()
    }

    func getLuminosity() {
        
        for i in 0...10 {
            var imageName = "0%"
            if i > 0 {
                imageName = "\(i)0%"
            }
            if let image = UIImage(named: imageName) {
                
                let luminance = AverageLuminanceExtractor()
                luminance.extractedLuminanceCallback = ({ luminance in
                    print("_____________________________")
                    print(imageName)
                    print(luminance)
                    print("_____________________________")
                })
                
                let pictureInput = PictureInput(image:image)
                let pictureOutput = PictureOutput()
                //        pictureOutput.imageAvailableCallback = {image in
                //            // Do something with image
                //
                //        }
                pictureInput --> luminance --> pictureOutput
                pictureInput.processImage(synchronously:true)
            }
            
        }
    }
}

