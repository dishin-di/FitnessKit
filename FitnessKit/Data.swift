//
//  JSON-Parse.swift
//  FitnessKit
//
//  Created by Всеволод Козлов on 13.02.2020.
//  Copyright © 2020 Всеволод Козлов. All rights reserved.
//

import Foundation
import Alamofire

struct FitnessJsonModel: Codable {
    var name: String
    var startTime: String
    var endTime: String
    var teacher: String
    var place: String
    var description: String
    var weekDayStr: String
    
    init?(json: [String : Any]) {
        guard
        let name = json["name"] as? String,
        let startTime = json["startTime"] as? String,
        let endTime = json["endTime"] as? String,
        let teacher = json["teacher"] as? String,
        let place = json["place"] as? String,
        let description = json["description"] as? String,
        let weekDay = json["weekDay"] as? UInt8
        else {return nil}
        
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
        self.teacher = teacher
        self.place = place
        self.description = description
        
        switch weekDay {
        case 1:
            weekDayStr = "Понедельник"
        case 2:
            weekDayStr = "Вторник"
        case 3:
            weekDayStr = "Среда"
        case 4:
            weekDayStr = "Четверг"
        case 5:
            weekDayStr = "Пятница"
        case 6:
            weekDayStr = "Суббота"
        case 7:
            weekDayStr = "Воскресенье"
        default:
            weekDayStr = ""
        }
    }
}

protocol HTTPReadDelegate {
    func reloadData()
}


class HTTPRead: NSObject {
    
    var fitModel: [FitnessJsonModel] {
        
        set {
            let codeData = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(codeData, forKey: "FitArray")
            UserDefaults.standard.synchronize()
        }
        
        get {
            if let decodeData = UserDefaults.standard.data(forKey: "FitArray") {
                let array = (try? JSONDecoder().decode([FitnessJsonModel].self, from: decodeData)) ?? []
               return array
            } else {
            return []
            }
        }
    }
    
    var delegate: HTTPReadDelegate?
    
    func getURLRequest(urlStr: String) {
        var fitMid: [FitnessJsonModel] = []
        
        AF.request(urlStr)
        .validate()
        .downloadProgress { progress in
            print(progress.localizedDescription ?? "")
        }
        .responseJSON { response in
            switch response.result {
                
            case .success(let value):
                
                guard let jsonArray = value as? Array<[String : Any]> else {return}
                
                for jsonObj in jsonArray {
                    guard let fitEl = FitnessJsonModel(json: jsonObj) else {return}
                    fitMid.append(fitEl)
                }
                self.fitModel = fitMid
                self.delegate?.reloadData()
                return
                
            case .failure(let eror):
                print(eror)
            }
        }
    }
}
