//
//  LiveActivityModuleHeader.m
//  dynamic_island
//
//  Created by Ankit Dhawan on 15/10/23.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(LiveActivity, NSObject)

RCT_EXTERN_METHOD(startActivity)
RCT_EXTERN_METHOD(endActivity)
RCT_EXTERN_METHOD(updateActivity: (NSString *) name)
  
@end
