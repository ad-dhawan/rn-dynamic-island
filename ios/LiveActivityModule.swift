//
//  LiveActivityModule.swift
//  dynamic_island
//
//  Created by Ankit Dhawan on 15/10/23.
//

import Foundation
import ActivityKit

@objc(LiveActivity)
class LiveActivity: NSObject {
  
  @objc(startActivity)
  func startActivity() {
    do{
      if #available(iOS 16.1, *){
        let liveActivityAttributes = LiveActivityAttributes(name: "Live Activity")
        let liveActivityContentState = LiveActivityAttributes.ContentState(leftName: "Left", rightName: "Right")
        let activity = try Activity<LiveActivityAttributes>.request(attributes: liveActivityAttributes, contentState: liveActivityContentState,  pushType: nil)
        
      }else{
        print("Dynamic Island and live activies not supported")
      }
      
    }catch (_){
      print("there is some error")
    }
  }
  
  
  @objc(updateActivity:)
  func updateActivity(name: String){
    do{
      if #available(iOS 16.1, *){
        let liveActivityContentState = LiveActivityAttributes.ContentState(leftName: name, rightName: "Right")
        Task{
          for activity in Activity<LiveActivityAttributes>.activities {
            await activity.update(using: liveActivityContentState)
          }
        }
      }
    }catch(_){
      print("some error")
    }
  }
  
  
  @objc(endActivity)
   func endActivity(){
     Task{
       for activity in Activity<LiveActivityAttributes>.activities {
         await activity.end()
       }
     }
   }
}
