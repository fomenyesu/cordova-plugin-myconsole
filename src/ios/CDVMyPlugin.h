//
//  CDVMyPlugin.h
//  plugintest
//
//  Created by yeaho-win on 15/9/9.
//
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface CDVMyPlugin : CDVPlugin

@property (nonatomic, copy) NSString* callbackID;

// Instance Method

- (void) print:(CDVInvokedUrlCommand*)command;

@end