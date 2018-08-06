//
//  ViewController.swift
//  SJTU_Robot_control_app
//
//  Created by Eric Lei on 6/8/2018.
//  Copyright © 2018 Eric Lei. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{

    var executeOrStop : Bool = true
    
    private let FLButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "FL"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(FLOnclick(_:)), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    
    
    private let FRButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "FR"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(FROnclick(_:)), for: UIControlEvents.touchUpInside)
        return button
    }()
    private let BLButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "BL"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(BLOnclick(_:)), for: UIControlEvents.touchUpInside)
        return button
    }()
    private let BRButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "BR"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(BROnclick(_:)), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    private let YText : UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Y:", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 36), NSAttributedStringKey.foregroundColor: UIColor.white])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    private let YIn : UITextField = {
        let txtIn = UITextField()
        txtIn.borderStyle = .roundedRect
        txtIn.keyboardAppearance = .dark
        txtIn.keyboardType = .default
        txtIn.font = UIFont.systemFont(ofSize: 28.0)
        txtIn.backgroundColor = UIColor.white
       // txtIn.returnKeyType = .done
        
        return txtIn
    }()
    
    private let ZText : UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Z:", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 36), NSAttributedStringKey.foregroundColor: UIColor.white])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    private let ZIn : UITextField = {
        let txtIn = UITextField()
        txtIn.borderStyle = .roundedRect
        txtIn.keyboardAppearance = .dark
        txtIn.keyboardType = .default
        txtIn.font = UIFont.systemFont(ofSize: 28.0)
        txtIn.backgroundColor = UIColor.white
        // txtIn.returnKeyType = .done
        
        return txtIn
    }()
    
    private let footModeText : UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "FOOT\nNODE", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedStringKey.foregroundColor: UIColor.white])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .left
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    private let wheelModeText : UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "WHEEL\nNODE", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedStringKey.foregroundColor: UIColor.white])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .right
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    private let modeSwitch : UISwitch = {
        let mySwitch = UISwitch()
        //mySwitch.onImage = #imageLiteral(resourceName: "switch_SJTU")
        mySwitch.tintColor = UIColor.darkGray
        mySwitch.onTintColor = UIColor.gray
        
        /*
        activating the switch of mode changing
        */
        mySwitch.addTarget(self, action: #selector(switchValueDidChange(_:)), for: UIControlEvents.valueChanged)
        return mySwitch
    }()
    
    private let onOffButton : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "onOff"), for: UIControlState.normal)
        button.addTarget(self, action: #selector(onOffOnclick(_:)), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    private let speedIn : UITextField = {
        let txtIn = UITextField()
        txtIn.borderStyle = .roundedRect
        txtIn.keyboardAppearance = .dark
        txtIn.keyboardType = .default
        txtIn.font = UIFont.systemFont(ofSize: 28.0)
        txtIn.backgroundColor = UIColor.white
        txtIn.placeholder = "Speed:"
        // txtIn.returnKeyType = .done
        
        return txtIn
    }()
    
    private let mmsText : UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "(mm/s)", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: UIColor.white])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    private let myBg : UIImageView = {
        let myIamgeView = UIImageView()
        myIamgeView.image = #imageLiteral(resourceName: "bg")
        return myIamgeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        YIn.delegate = self
        ZIn.delegate = self
        speedIn.delegate = self
    }
    
    //close the top bar of iPhone
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    @objc func FLOnclick(_ sender : UIButton!){
        print("FL on click")
    }
    
    
    @objc func FROnclick(_ sender : UIButton!){
        print("FR on click")
    }
    
    @objc func BLOnclick(_ sender : UIButton!){
        print("BL on click")
    }
    
    @objc func BROnclick(_ sender : UIButton!){
        print("BR on click")
    }
    
    @objc func onOffOnclick(_ sender : UIButton!){
        print("onOff on click")
        if executeOrStop {
            if modeSwitch.isOn{
                executingWheelMode()
            }else{
                executingFootMode()
            }
        }else{
            stopTheRobot()
        }
//        print(executeOrStop)
        executeOrStop = !executeOrStop
//        print(executeOrStop)
    }
    
    private func executingWheelMode () {
        print("executing the wheel mode")
    }
    
    private func executingFootMode () {
        print("executing the foot mode")
    }
    
    private func stopTheRobot () {
        print("stop the robot")
    }
    
    @objc func switchValueDidChange(_ sender:UISwitch!)
    {
        
            if (sender.isOn){
                print("on")
                speedIn.isEnabled = true
            }
            else{
                
                print("off")
                speedIn.isEnabled = false
                speedIn.text = ""
            }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //when we click the <return> or <enter> of the keyboard of the iPhone, close the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
   }
    
    //activating when the user touches other place, close the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setUpLayout(){
        
        view.backgroundColor = UIColor.black
        
        view.addSubview(myBg)
        myBg.translatesAutoresizingMaskIntoConstraints = false
        myBg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myBg.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //the top container set up
        let topContainerView = UIView()
        topContainerView.backgroundColor = .clear
        view.addSubview(topContainerView)
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        topContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
       topContainerView.addSubview(FLButton)
       FLButton.translatesAutoresizingMaskIntoConstraints = false
//
       FLButton.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 25).isActive = true
       //FLButton.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -240).isActive = true
        FLButton.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.3).isActive = true
       FLButton.widthAnchor.constraint(equalTo: FLButton.heightAnchor, multiplier: 1.2).isActive =  true
        FLButton.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 10).isActive = true
        
        topContainerView.addSubview(FRButton)
        FRButton.translatesAutoresizingMaskIntoConstraints = false
        //
        //FRButton.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 25).isActive = true
        FRButton.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -25).isActive = true
        FRButton.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.3).isActive = true
        FRButton.widthAnchor.constraint(equalTo: FRButton.heightAnchor, multiplier: 1.2).isActive =  true
        FRButton.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 10).isActive = true
        
        topContainerView.addSubview(BLButton)
        BLButton.translatesAutoresizingMaskIntoConstraints = false
        //
        BLButton.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 25).isActive = true
        //FLButton.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -240).isActive = true
        BLButton.heightAnchor.constraint(equalTo: FLButton.heightAnchor).isActive = true
        BLButton.widthAnchor.constraint(equalTo: FLButton.widthAnchor).isActive =  true
        //BLButton.topAnchor.constraint(equalTo: FLButton.bottomAnchor, constant: 60).isActive = true
        BLButton.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        
        topContainerView.addSubview(BRButton)
        BRButton.translatesAutoresizingMaskIntoConstraints = false
        //
        //BRButton.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 25).isActive = true
        BRButton.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -25).isActive = true
        BRButton.heightAnchor.constraint(equalTo: FLButton.heightAnchor).isActive = true
        BRButton.widthAnchor.constraint(equalTo: FLButton.widthAnchor).isActive =  true
        //BLButton.topAnchor.constraint(equalTo: FLButton.bottomAnchor, constant: 60).isActive = true
        BRButton.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        
        topContainerView.addSubview(YText)
        YText.translatesAutoresizingMaskIntoConstraints = false
        YText.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 10).isActive = true
        YText.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: -5).isActive = true
//        YText.backgroundColor = topContainerView.backgroundColor
        
        topContainerView.addSubview(YIn)
        YIn.translatesAutoresizingMaskIntoConstraints = false
        YIn.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: 57).isActive = true
        YIn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        YIn.widthAnchor.constraint(equalToConstant: 115).isActive = true
        YIn.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: -10).isActive = true
        
        topContainerView.addSubview(ZText)
        ZText.translatesAutoresizingMaskIntoConstraints = false
        ZText.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -137).isActive = true
        ZText.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: -5).isActive = true
//        ZText.backgroundColor = topContainerView.backgroundColor
        
        topContainerView.addSubview(ZIn)
        ZIn.translatesAutoresizingMaskIntoConstraints = false
        ZIn.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: -20).isActive = true
        ZIn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        ZIn.widthAnchor.constraint(equalToConstant: 115).isActive = true
        ZIn.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: -10).isActive = true
        
        
        //the mid container set up
        let midContainerView = UIView()
        midContainerView.backgroundColor = .clear
        view.addSubview(midContainerView)
        midContainerView.translatesAutoresizingMaskIntoConstraints = false
        midContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        midContainerView.topAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        midContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        midContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        midContainerView.addSubview(footModeText)
        footModeText.translatesAutoresizingMaskIntoConstraints = false
        footModeText.leadingAnchor.constraint(equalTo: midContainerView.leadingAnchor, constant: 10).isActive = true
        footModeText.centerYAnchor.constraint(equalTo: midContainerView.centerYAnchor).isActive = true
//        footModeText.backgroundColor = UIColor.clear
        
        midContainerView.addSubview(wheelModeText)
        wheelModeText.translatesAutoresizingMaskIntoConstraints = false
        wheelModeText.trailingAnchor.constraint(equalTo: midContainerView.trailingAnchor, constant: -10).isActive = true
        wheelModeText.centerYAnchor.constraint(equalTo: midContainerView.centerYAnchor).isActive = true
        
        
        midContainerView.addSubview(modeSwitch)
        modeSwitch.translatesAutoresizingMaskIntoConstraints = false
        modeSwitch.centerXAnchor.constraint(equalTo: midContainerView.centerXAnchor).isActive = true
        modeSwitch.centerYAnchor.constraint(equalTo: midContainerView.centerYAnchor).isActive = true
        
        
        
        
        //the bot container set up
        let botContainerView = UIView()
        botContainerView.backgroundColor = .clear
        view.addSubview(botContainerView)
        botContainerView.translatesAutoresizingMaskIntoConstraints = false
        botContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25).isActive = true
        botContainerView.topAnchor.constraint(equalTo: midContainerView.bottomAnchor).isActive = true
        botContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        botContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        botContainerView.addSubview(onOffButton)
        onOffButton.translatesAutoresizingMaskIntoConstraints = false
        onOffButton.centerYAnchor.constraint(equalTo: botContainerView.centerYAnchor).isActive = true
        onOffButton.leadingAnchor.constraint(equalTo: botContainerView.leadingAnchor, constant: 20).isActive = true
        onOffButton.heightAnchor.constraint(equalTo: botContainerView.heightAnchor, multiplier: 0.7).isActive = true
        onOffButton.widthAnchor.constraint(equalTo: onOffButton.heightAnchor, multiplier: 1).isActive = true
        
        botContainerView.addSubview(speedIn)
        speedIn.translatesAutoresizingMaskIntoConstraints = false
        speedIn.centerYAnchor.constraint(equalTo: botContainerView.centerYAnchor, constant: -10).isActive = true
        speedIn.trailingAnchor.constraint(equalTo: botContainerView.trailingAnchor, constant: -40).isActive = true
        speedIn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        speedIn.widthAnchor.constraint(equalToConstant: 135).isActive = true
        if modeSwitch.isOn {
            speedIn.isEnabled = true
        }else{
            speedIn.isEnabled = false
        }
        
        botContainerView.addSubview(mmsText)
        mmsText.translatesAutoresizingMaskIntoConstraints = false
        //mmsText.bottomAnchor.constraint(equalTo: botContainerView.bottomAnchor, constant: -10).isActive = true
        mmsText.topAnchor.constraint(equalTo: speedIn.bottomAnchor, constant: 0).isActive = true
        //mmsText.trailingAnchor.constraint(equalTo: botContainerView.trailingAnchor, constant: -50).isActive = true
        mmsText.centerXAnchor.constraint(equalTo: speedIn.centerXAnchor, constant: -10).isActive = true
        
        
    }

   
}

