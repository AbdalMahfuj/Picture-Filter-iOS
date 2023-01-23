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
    var cifilter = CIFilter(name: "CISepiaTone")!
    let corefilters = CoreFilters()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let uiImage = UIImage(named: "imageOne") else { return }
        let ciImage = CIImage(image: uiImage)
        cifilter.setValue(ciImage, forKey: kCIInputImageKey)
        intesitySlider.value = 0.0
        sliderDidChanged(value: 0.0)
    }

    
    @IBAction func galleryButtonPressed(_ sender: UIButton) {
        loadPhoto()
    }
    
    
    @IBAction func sliderPressed() {
        sliderDidChanged(value: intesitySlider.value)
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
    
    private func loadPhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true)
    }
    
    
    // Filters Button
    
    @IBAction func invertButtonPressed(_ sender: UIButton) {
        cifilter = CIFilter(name: corefilters.Invert)!
    }
    
    
    @IBAction func mapPressed(_ sender: UIButton) {
        cifilter = CIFilter(name: corefilters.map)!
    }
    
    @IBAction func posterizePressed(_ sender: UIButton) {
        cifilter = CIFilter(name: corefilters.Posterize)!
    }
    
    
    @IBAction func falseColorPressed(_ sender: UIButton) {
        cifilter = CIFilter(name: corefilters.FalseColor)!
    }
    
    
    @IBAction func fadePressed(_ sender: UIButton) {
        cifilter = CIFilter(name: corefilters.fade)!
    }
    
    
    @IBAction func monoPressed(_ sender: UIButton) {
        cifilter = CIFilter(name: corefilters.Mono)!
    }
    
    
    @IBAction func chromeEffectPressed(_ sender: UIButton) {
        cifilter = CIFilter(name: corefilters.ChromeEffect)!
    }
    
    @IBAction func noirPressed(_ sender: Any) {
        cifilter = CIFilter(name: corefilters.Noir)!
    }
    
    @IBAction func applyPressed(_ sender: UIButton) {
        applyFilter(intensity: intesitySlider.value)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //1
        guard let selectedImage = info[.originalImage] as? UIImage else { return }

        //2
        let ciImage = CIImage(image: selectedImage)
        cifilter.setValue(ciImage, forKey: kCIInputImageKey)

        //3
        intesitySlider.value = 0.0
        sliderDidChanged(value: 0.0)

        //4
        dismiss(animated: true)

    }
}
