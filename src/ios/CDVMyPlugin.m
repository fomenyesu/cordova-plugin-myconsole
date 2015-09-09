//
//  CDVMyPlugin.m
//  plugintest
//
//  Created by yeaho-win on 15/9/9.
//
//

#import "CDVMyPlugin.h"

@implementation CDVMyPlugin

@synthesize callbackID;


-(void)print:(CDVInvokedUrlCommand*)command
{
    
    
    // 得到Javascript端发送过来的字符串
    NSString *stringObtainedFromJavascript = [command argumentAtIndex:0];
    
    // 创建我们要返回给js端的字符串
    NSMutableString *stringToReturn = [NSMutableString stringWithString: @"我是返回的:"];
    
    [stringToReturn appendString: stringObtainedFromJavascript];
    
    // Create Plugin Result
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: stringToReturn];
    
    NSLog(@ "%@",stringToReturn);
    
    
    // 检查发送过来的字符串是否等于"HelloWorld",如果不等,就以PluginResult的Error形式返回
    if ([stringObtainedFromJavascript isEqualToString:@"HelloWorld"] == YES){
        // Call the javascript success function
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } else{
        // Call the javascript error function
        NSLog(@"Failed to process asset(s)");
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"error"] callbackId:command.callbackId];
    }
}
@end