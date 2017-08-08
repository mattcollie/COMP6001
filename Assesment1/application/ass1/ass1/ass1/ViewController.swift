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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = self
        _color = ColorController.init(controller)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}

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
            _view.view.backgroundColor = Color
        }
    }
    public var Green:Float {
        get {
            return _green
        }
        set(value) {
            _green = value
            _view.view.backgroundColor = Color
        }
    }
    public var Blue:Float {
        get {
            return _blue
        }
        set(value) {
            _blue = value
            _view.view.backgroundColor = Color
        }
    }
    public var Alpha:Float {
        get {
            return _alpha
        }
        set(value) {
            _alpha = value
            _view.view.backgroundColor = Color
        }
        
    }
    private var Color:UIColor {
        get {
            return UIColor(red: CGFloat(Red), green: CGFloat(Green), blue: CGFloat(Blue), alpha: CGFloat(Alpha))
        }
    }
    
    init(_ view:ViewController) {
        _view = view
    }
    
    init(view:ViewController, red:Float, green:Float, blue:Float, alpha:Float) {
        self._view = view
        self.Red = red
        self.Green = green
        self.Blue = blue
        self.Alpha = alpha
    }
}
