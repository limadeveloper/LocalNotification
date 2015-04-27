//
//  ViewController.swift
//  LocalNotification
//
//  Created by John Silva on 4/26/15.
//  Copyright (c) 2015 John Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK:
    // MARK: constantes e variáveis
    @IBOutlet var tf: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var labelN: UILabel!
    
    var timer: NSTimer!
    
    // MARK: 
    // MARK: view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tf.delegate = self
        labelN.hidden = true
        radioObject(labelN)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK:
    // MARK: IBActions
    @IBAction func ativar(sender: UIBarButtonItem) {
        createNotification(tf.text, hora: datePicker.date, alertAction: "tirar uma soneca", som: "sirenePolicia.mp3")
        labelAnimada(labelN)
        timer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: "setTimer", userInfo: nil, repeats: false)
    }
    
    // MARK:
    // MARK: actions
    func createNotification(mensagem: String, hora: NSDate, alertAction: String, som: String) {
        
        println("M: \(mensagem) \nH: \(hora) \nA: \(alertAction) \nS: \(som)")
        
        var localNotification: UILocalNotification = UILocalNotification()
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.fireDate = hora
        localNotification.alertBody = mensagem
        localNotification.alertAction = alertAction
        localNotification.soundName = som
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
    }
    
    // MARK:
    // MARK: text field delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func labelAnimada(label: UILabel) {
        
        labelN.hidden = false
        label.center.x = self.view.frame.width + 30
        
        UIView.animateWithDuration(4.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 30, options: nil, animations: ({
            label.center.x = self.view.frame.width / 2
        }), completion: nil)
        
    }
    
    func radioObject(obj: UILabel) {
        var ro: CALayer = obj.layer
        ro.masksToBounds = true
        ro.cornerRadius = 26
    }
    
    func setTimer() {
        println("funfou")
        labelN.hidden = true
        timer.invalidate()
    }
    
}

