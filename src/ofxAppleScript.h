//
//  ofxAppleScript.h
//
//  Created by ISHII 2bit.
//

#pragma once

#include "ofMain.h"

bool ofxRunAppleScript(NSString *command);
bool ofxRunAppleScript(string command);
bool ofxRunAppleScriptFromFile(string filePath);
bool ofxRunAppleScriptFromFile(ofFile file);