//
//  ViewController.swift
//  ass1
//
//  Created by Matt & Geoff on 9/08/17.
//  Copyright © 2017 Matt & Geoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var _color:ColorController!
    @IBOutlet weak var controller:ViewController!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var btnSetColour: UIButton!
    @IBOutlet weak var btnReset: UIButton!
    @IBOutlet weak var txtInstruction: UITextView!
    @IBOutlet weak var txtWelcome: UITextView!
    
    @IBOutlet weak var btnInfo: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = self
        btnReset.backgroundColor = btnSetColour.backgroundColor
        _color = ColorController.init(view: controller, red: Float(redSlider.value), green: Float(greenSlider.value), blue: Float(blueSlider.value))
        
        setSliderColors(slider: redSlider, color: UIColor.red)
        setSliderColors(slider: greenSlider, color: UIColor.green)
        setSliderColors(slider: blueSlider, color: UIColor.blue)
        
        btnReset.layer.borderColor = UIColor.black.cgColor
        btnReset.layer.borderWidth = 1.0
        btnReset.layer.cornerRadius = 7.0
        
        btnSetColour.layer.borderColor = UIColor.black.cgColor
        btnSetColour.layer.borderWidth = 1.0
        btnSetColour.layer.cornerRadius = 7.0
    }

    @IBAction func btnInfo_TouchUpInside(_ sender: Any) {
        txtInstruction.isHidden = !txtInstruction.isHidden
        txtWelcome.isHidden = !txtWelcome.isHidden
    }
    
    @IBAction func btnSetColour_TouchUpInside(_ sender: Any) {
        view.backgroundColor = _color.Color
        
        btnSetColour.setTitleColor(_color.getContrastColour(), for: UIControlState.normal)
        btnReset.setTitleColor(_color.getContrastColour(), for: UIControlState.normal)
        btnSetColour.layer.borderColor = _color.getContrastColour().cgColor
        btnReset.layer.borderColor = _color.getContrastColour().cgColor
        btnInfo.tintColor = _color.getContrastColour()
        txtWelcome.textColor = _color.getContrastColour()
        txtInstruction.textColor = _color.getContrastColour()
    }
    
    @IBAction func btnReset_TouchUpInside(_ sender: Any) {
        _color.reset()
        view.backgroundColor = _color.Color
        btnSetColour.setTitleColor(_color.getContrastColour(), for: UIControlState.normal)
        btnReset.setTitleColor(_color.getContrastColour(), for: UIControlState.normal)
        btnInfo.tintColor = _color.getContrastColour()
        txtWelcome.textColor = _color.getContrastColour()
        txtInstruction.textColor = _color.getContrastColour()
        btnSetColour.layer.borderColor = _color.getContrastColour().cgColor
        btnReset.layer.borderColor = _color.getContrastColour().cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func redSlider_ValueChanged(_ sender: UISlider) {
        _color.Red = sender.value
    }

    @IBAction func greenSlider_Changed(_ sender: UISlider) {
        _color.Green = sender.value
    }
    
    @IBAction func blueSlider_Changed(_ sender: UISlider) {
        _color.Blue = sender.value
    }
    
    private func setSliderColors(slider:UISlider, color:UIColor) {
        slider.minimumTrackTintColor = color
        slider.maximumTrackTintColor = color
    }
}
