//
//  ofxAppleScript.mm
//
//  Created by ISHII 2bit.
//

#import "ofxAppleScript.h"
#import "ofxObjective-C++Utility.h"

bool ofxRunAppleScript(NSString *command) {
    NSAppleScript *script = [[[NSAppleScript alloc] initWithSource:command] autorelease];
    NSDictionary *error = nil;
    if (![script executeAndReturnError:&error]) {
        NSString *errorString = [error description];
        ofLogError("ofxAppleScript") << [errorString UTF8String];
        return false;
    } else {
        return true;
    }
}

bool ofxRunAppleScript(string command) {
    return ofxRunAppleScript(convert(command));
}

bool ofxRunAppleScriptFromFile(string filePath) {
    ofFile file;
    file.open(filePath);
    
    return ofxRunAppleScriptFromFile(file);
}

bool ofxRunAppleScriptFromFile(ofFile file) {
    if(file.exists() && file.isFile()) {
        ofBuffer buf = file.readToBuffer();
        
        return ofxRunAppleScript(buf.getText());
    } else {
        if(!file.exists()) {
            ofLogWarning("ofxAppleScript") << file.path() << " isn't exists.";
        } else {
            ofLogWarning("ofxAppleScript") << file.path() << " isn't file.";
        }
        return false;
    }
}