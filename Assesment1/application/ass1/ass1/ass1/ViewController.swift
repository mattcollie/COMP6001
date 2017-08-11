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
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = self
        _color = ColorController.init(view: controller, red: Float(redSlider.value), green: Float(greenSlider.value), blue: Float(blueSlider.value))
        
        setSliderColors(slider: redSlider, color: UIColor.red)
        setSliderColors(slider: greenSlider, color: UIColor.green)
        setSliderColors(slider: blueSlider, color: UIColor.blue)
        
    }

    @IBAction func btnSetColour_TouchUpInside(_ sender: Any) {
        view.backgroundColor = _color.Color
        
        btnSetColour.setTitleColor(_color.getContrastColour(), for: UIControlState.normal)
        btnReset.setTitleColor(_color.getContrastColour(), for: UIControlState.normal)

    }
    
    @IBAction func btnReset_TouchUpInside(_ sender: Any) {
        _color.reset()
        view.backgroundColor = _color.Color
        btnSetColour.setTitleColor(_color.getContrastColour(), for: UIControlState.normal)
        btnReset.setTitleColor(_color.getContrastColour(), for: UIControlState.normal)    }
    
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
