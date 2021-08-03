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
        
        let storBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard?.instantiateViewController(identifier: "ColorViewController") as! ColorViewController
        
        switch strColors[indexPath.row] {
            case "blue":
                nextViewController.view.backgroundColor = UIColor.blue
                nextViewController.colorLabel.text = strColors[indexPath.row]
                
            case "red":
                nextViewController.view.backgroundColor = UIColor.red
                nextViewController.colorLabel.text = strColors[indexPath.row]
            case "green":
                nextViewController.view.backgroundColor = UIColor.green
                nextViewController.colorLabel.text = strColors[indexPath.row]
            default:
                return
        }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
        
    }
    
}

extension ViewController {
    
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
