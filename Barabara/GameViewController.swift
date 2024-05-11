//
//  GameViewController.swift
//  Barabara
//
//  Created by 柘植俊之介 on 2024/05/11.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    var timer: Timer!
    var score: Int = 1000
    let saveData: UserDefaults = UserDefaults.standard
    
    let width: CGFloat = UIScreen.main.bounds.size.width
    var positionX: [CGFloat] = [0.0, 0.0, 0.0]
    var dx: [CGFloat] = [1.0, 0.5,
    -1.0]
    
    func start(){
        resultLabel.isHidden  = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil,  repeats: true)
        timer.fire()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2, width/2, width/2]
        self.start()
        
        
    }

    
    @objc func up() {
        for i in 0..<3 {
    //端に来たら動かす方向を逆向きにする
    if positionX[i] > width || positionX[i] < 0 {
    dx[i] = dx[i] * -1
    }
    //画像の位置をdx分ずらす
    positionX[i] += dx[i]
                                       }
    //画像をずらした位置に移動させる
    imageView1.center.x = positionX[0]
    imageView2.center.x = positionX[1]
    imageView3.center.x = positionX[2]
                                       }
    
    @IBAction func stop(){
        if timer.isValid == true {
            timer.invalidate()
        }
        
        for i in 0..<3 {
            
            score = score - abs(Int(width/2 - positionX[i]))*2
        }
        //結果ラベルにスコアを表示する
        resultLabel.text = "Score: " +
        String(score)
        //結果ラベルを表示する
        resultLabel.isHidden = false
        
        let highScore1: Int = saveData.integer(forKey: "score1")
        let highScore2: Int = saveData.integer(forKey: "score2")
        let highScore3: Int = saveData.integer(forKey: "score3")
        if
        score > highScore1 {
        saveData.set(score, forKey: "score1")
            saveData.set(highScore1, forKey: "score2")
            saveData.set(highScore2, forKey: "score3")
        } else if score > highScore2 {
        saveData.set(score, forKey: "score2")
            saveData.set(highScore2, forKey: "score3")
        } else if score > highScore3 {
        saveData.set(score, forKey: "score3")
        }
        
    }
    
    @IBAction func retry(){
        score = 1000
        positionX  = [width/2,width/2,width/2]
        
        if timer.isValid == false {
            self.start()
        }
        
    }
    
    @IBAction func toTop(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
*/
}
