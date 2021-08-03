//
//  ViewController.swift
//  ColorPickApp
//
//  Created by zebedee on 2021/02/08.
//

import UIKit

struct ColorName {
    
    var colors: [String]
}

class ViewController: UIViewController {
    
    var strColors: [String] = []

    @IBOutlet weak var colorTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let nameColors = ColorName(colors: ["blue","red","green"])
        
        strColors = nameColors.colors
 
        colorTableView.delegate = self
        colorTableView.dataSource = self

    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = colorTableView.dequeueReusableCell(withIdentifier: "colorTableView")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "colorCell")
        }
        
        cell?.backgroundColor = cellCustomColor(strColors[indexPath.row])
        cell?.textLabel?.text = strColors[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        navigateControl(strColors[indexPath.row])
    }
    
}

extension ViewController {
    
    private func navigateControl(_ destinationColor: String){
        
        let _ : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard?.instantiateViewController(identifier: "ColorViewController") as! ColorViewController
        
        nextViewController.view.backgroundColor = cellCustomColor(destinationColor)
        nextViewController.colorLabel.text = destinationColor

        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    private func cellCustomColor(_ colorName: String) -> UIColor {
        switch colorName {
            case "blue":
                return .blue
            case "red":
                return .red
            case "green":
                return .green
            default:
                return .white
        }
    }
    
}
