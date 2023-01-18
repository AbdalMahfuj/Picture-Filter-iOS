//
//  ViewController.swift
//  ImageFilter
//
//  Created by MAHFUJ on 18/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var intesityLabel: UILabel!
    @IBOutlet weak var intesitySlider: UISlider!
    let ciContext = CIContext(options: nil)
    let cifilter = CIFilter(name: "CISepiaTone")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let uiImage = UIImage(named: "imageOne") else { return }
        let ciImage = CIImage(image: uiImage)
        cifilter.setValue(ciImage, forKey: kCIInputImageKey)
        intesitySlider.value = 0.0
        sliderDidChanged(value: 0.0)
    }

    
    @IBAction func sliderPressed() {
        sliderDidChanged(value: intesitySlider.value)
        applyFilter(intensity: intesitySlider.value)
    }
    
    private func sliderDidChanged(value: Float) {
        intesityLabel.text = String(format: "%.2f", value)
    }
    
    func applyFilter(intensity: Float) {
        cifilter.setValue(intensity, forKey: kCIInputIntensityKey)
        guard let outputImage = cifilter.outputImage else {return}
        guard let cgImage = ciContext.createCGImage(outputImage, from: outputImage.extent) else {return}
        myImage.image = UIImage(cgImage: cgImage)
        
    }
    
    
}
