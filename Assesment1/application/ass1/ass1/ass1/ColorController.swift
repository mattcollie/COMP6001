//
//  ColorController.swift
//  ass1
//
//  Created by Matt & Geoff on 10/08/17.
//  Copyright © 2017 Matt & Geoff. All rights reserved.
//

import UIKit


class ColorController {
    
    private var _view:ViewController
    private var _red:Float = 0
    private var _green:Float = 0
    private var _blue:Float = 0
    private var _alpha:Float = 1
    public var Red:Float {
        get {
            return _red
        }
        set(value) {
            _red = value
            setColor()
        }
    }
    public var Green:Float {
        get {
            return _green
        }
        set(value) {
            _green = value
            setColor()
        }
    }
    public var Blue:Float {
        get {
            return _blue
        }
        set(value) {
            _blue = value
            setColor()
        }
    }
    public var Alpha:Float {
        get {
            return _alpha
        }
        set(value) {
            _alpha = value
            setColor()
        }
        
    }
    public var Color:UIColor {
        get {
            return UIColor(red: CGFloat(Red), green: CGFloat(Green), blue: CGFloat(Blue), alpha: CGFloat(Alpha))
        }
    }
    
    private func setColor() {
        _view.btnSetColour.backgroundColor = Color
        _view.btnSetColour.setTitleColor(getContrastColour(), for: UIControlState.normal)
        _view.btnSetColour.layer.borderColor = getContrastColour().cgColor
    }
    
    public func getContrastColour() -> UIColor {
        var d:Float = 0
        let a:Float = 1 - ( 0.299 * (Red*255) + 0.587 * (Green*255) + 0.114 * (Blue*255))/255
        if (a < 0.5) {
            d = 0
        }
        else {
            d = 1
        }
        let color:UIColor = UIColor(red: CGFloat(d), green: CGFloat(d), blue: CGFloat(d), alpha: CGFloat(1))
        return color
    }
    
    public func reset() {
        _red = 1
        _green = 1
        _blue = 1
        _view.btnSetColour.backgroundColor = Color
        _view.redSlider.value = 1
        _view.greenSlider.value = 1
        _view.blueSlider.value = 1
    }
    
    init(_ view:ViewController) {
        _view = view
        
    }
    
    init(view:ViewController, red:Float, green:Float, blue:Float) {
        self._view = view
        self.Red = red
        self.Green = green
        self.Blue = blue
    }
}
