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
    @IBOutlet weak var filerSelected: UILabel!
    
    @IBOutlet weak var filerStackView1: UIStackView!
    @IBOutlet weak var filerStackView2: UIStackView!


    let ciContext = CIContext(options: nil)
    var cifilter = CIFilter(name: "CISepiaTone")!
    let corefilters = CoreFilters()
    
    private var surceImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        surceImage = UIImage(named: "imageOne")
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
    
    func applyFilter() {
        guard let surceImage else { return }
        let ciImage = CIImage(image: surceImage)
        cifilter.setValue(ciImage, forKey: kCIInputImageKey)

        //cifilter.setValue(intensity, forKey: kCIInputIntensityKey)
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
    @IBAction func filterPressed(_ sender: UIButton) {
        let filterName = CoreFilters.filterByTag(tag: sender.tag)
        cifilter = CIFilter(name: filterName)!
        filerSelected.text = "Selected: \(filterName)"
        
        let buttons = filerStackView1.subviews + filerStackView2.subviews
        
        for btn in buttons {
            if btn is UIButton {
                btn.backgroundColor = (btn as! UIButton) == sender ? .red : .link
            }
        }
    }
    
    @IBAction func applyDidPressed(_ sender: UIButton) {
        applyFilter()
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        myImage.image = surceImage
        let buttons = filerStackView1.subviews + filerStackView2.subviews
        
        for btn in buttons {
            if btn is UIButton {
                btn.backgroundColor = .link
            }
        }
        filerSelected.text = "Select One"
    }
    
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        surceImage = selectedImage
        myImage.image = surceImage

        intesitySlider.value = 0.0
        sliderDidChanged(value: 0.0)

        dismiss(animated: true)
    }
}
