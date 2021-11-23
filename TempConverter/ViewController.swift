//
//  ViewController.swift
//  TempConverter
//
//  Created by David Svensson on 2021-11-23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // temperatur i F = 1.8 * temperaturInCelsius + 32
    @IBOutlet weak var temperaturLabel: UILabel!
    
    @IBOutlet weak var celsiusPickerView: UIPickerView!
    
    private let userDefaultsRowKey = "defaultsPickerRow"
    private var temperatureValues = (-100...100).map{$0}   //[Int]()
    
    let converter = CelsiusConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for index in -100...100 {
//            temperatureValues.append(index)
//        }
        
        let defaultPickerRow = initialPickerRow()
        
        celsiusPickerView.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(celsiusPickerView, didSelectRow: defaultPickerRow, inComponent: 0)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureValues.count
            
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        return ("\(temperatureValues[row]) ºC")
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print("vald rad: \(row) värde: \(temperatureValues[row])")
        
        let degreeC = temperatureValues[row]
        let degrreF = converter.degreesFahrenheit(degreesCelsius: degreeC)
        
        temperaturLabel.text = "\(degrreF) ºF"
        saveSelected(row: row)
    }
    
    func initialPickerRow() -> Int {
        
        let savedRow = UserDefaults.standard.object(forKey: userDefaultsRowKey) as? Int
        
        if let row = savedRow {
            return row
        } else {
            return temperatureValues.count / 2
        }
        
    }
    
    
    func saveSelected(row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsRowKey)
        defaults.synchronize()
    }
    


}

