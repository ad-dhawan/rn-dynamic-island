//
//  LiveActivityLiveActivity.swift
//  LiveActivity
//
//  Created by Ankit Dhawan on 15/10/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var leftName: String
        var rightName: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct LiveActivityLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text(context.state.leftName)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.rightName)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom Content")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("R")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
