import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var p5Label: UILabel!
    @IBOutlet weak var p4Label: UILabel!
    @IBOutlet weak var p3Label: UILabel!
    @IBOutlet weak var p2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let currencyFormatter = NumberFormatter()
         currencyFormatter.usesGroupingSeparator = true
         currencyFormatter.numberStyle = .currency
         currencyFormatter.locale = Locale.current
        totalLabel.text = String(format: "\(currencyFormatter.currencySymbol!)0.00")
        tipLabel.text = String(format: "\(currencyFormatter.currencySymbol!)0.00")
        p2Label.text = String(format: "\(currencyFormatter.currencySymbol!)0.00")
        p3Label.text = String(format: "\(currencyFormatter.currencySymbol!)0.00")
        p4Label.text = String(format: "\(currencyFormatter.currencySymbol!)0.00")
        p5Label.text = String(format: "\(currencyFormatter.currencySymbol!)0.00")
        
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func tipCalculator(_ sender: Any) {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        let tipArray = [0.1,0.15,0.18]
        let bill = Double(billLabel.text!) ?? 0
        let tip = bill*tipArray[tipControl.selectedSegmentIndex]
        let total  = bill + tip
        totalLabel.text = String(format: "\(currencyFormatter.currencySymbol!)%.2f", total)
        tipLabel.text = String(format: "\(currencyFormatter.currencySymbol!)%.2f", tip)
        p2Label.text = String(format: "\(currencyFormatter.currencySymbol!)%.2f", Double(total/2))
        p3Label.text = String(format: "\(currencyFormatter.currencySymbol!)%.2f", Double(total/3))
        p4Label.text = String(format: "\(currencyFormatter.currencySymbol!)%.2f", Double(total/4))
        p5Label.text = String(format: "\(currencyFormatter.currencySymbol!)%.2f", Double(total/5))
    }
    
}

