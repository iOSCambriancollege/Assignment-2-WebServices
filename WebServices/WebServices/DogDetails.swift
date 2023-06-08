//
//  DogDetails.swift
//  WebServices
//
//  Created by Gaurang Naik on 2023-06-07.
//

import UIKit

class DogDetails: UIViewController {
    
    @IBOutlet weak var Breed :UILabel!
    @IBOutlet weak var DogDImage :UIImageView!
    
    var dogData:DogData  = DogData()
    var currentBreed:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Task {
            do {
                let API_Response = try await DogAPI_Helper.fetchDogData()
                dogData.message = API_Response.message
                dogData.status = API_Response.status

                Breed.text = currentBreed
                //DogDImage.image = UIImage(contentsOfFile: dogData.message)//try await DogAPI_Helper.fetchDogData()
                DogDImage.image = try await DogAPI_Helper.fetchDogImageData(urlString: dogData.message)
                print(dogData.message)
            }
            catch {
                preconditionFailure("Error Occured \(error)")
            }
        }
        
    }
    
    @IBAction func ChangeImage(_ sender : UIButton){
        
        Task {
            do {
                let API_Response = try await DogAPI_Helper.fetchDogData()
                dogData.message = API_Response.message
                dogData.status = API_Response.status
               // print(dogData.message)
                
                //tableView.reloadData()
                
                Breed.text = currentBreed
                //DogDImage.image = UIImage(contentsOfFile: dogData.message)//try await DogAPI_Helper.fetchDogData()
                DogDImage.image = try await DogAPI_Helper.fetchDogImageData(urlString: dogData.message)
                print(dogData.message)
            }
            catch {
                preconditionFailure("Error Occured \(error)")
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


