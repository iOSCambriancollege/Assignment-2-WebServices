//
//  DogCellView.swift
//  WebServices
//
//  Created by Gaurang Naik on 2023-06-07.
//

import UIKit

class DogCellView: UITableViewCell {
    
        @IBOutlet weak var Breed :UILabel!
        @IBOutlet weak var SubBreed :UILabel!
        @IBOutlet weak var DogImage :UIImageView!
        var dogData:DogData  = DogData()
        
      
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        Task {
            do {
                let API_Response = try await DogAPI_Helper.fetchDogData()
                dogData.message = API_Response.message
                dogData.status = API_Response.status
                DogImage.image = try await DogAPI_Helper.fetchDogImageData(urlString: dogData.message)
                print(dogData.message)
            }
            catch {
                preconditionFailure("Error Occured \(error)")
            }
        }
    }

}
