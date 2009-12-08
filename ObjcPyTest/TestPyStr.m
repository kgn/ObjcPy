#import <Foundation/Foundation.h>
#import "NSString+PyStr.h"

void boolToStdout(BOOL value){
    fprintf(stdout, "%d", value);
}

void stringToStdout(NSString *value){
    fprintf(stdout, "%s", [value UTF8String]);
}

void arrayToStdout(NSArray *value){
    fprintf(stdout, "%s", [[value componentsJoinedByString:@":"] UTF8String]);
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    NSUserDefaults *inputArgs = [NSUserDefaults standardUserDefaults];
    
    NSString *valueArg = [inputArgs objectForKey:@"value"];
    if(valueArg){
        // center
        NSNumber *centerArg = [inputArgs objectForKey:@"center"];
        if(centerArg){
            NSString *fillcharArg = [inputArgs objectForKey:@"fillchar"];
            if(fillcharArg){
                stringToStdout([valueArg center:[centerArg intValue] fillchar:fillcharArg]);
            }
            else{
                stringToStdout([valueArg center:[centerArg intValue]]);
            }
        }
        
        // endswith
        NSString *endswithArg = [inputArgs objectForKey:@"endswith"];
        if(endswithArg){
            boolToStdout([valueArg endswith:endswithArg]);
        }
        
        // startswith
        NSString *startswithArg = [inputArgs objectForKey:@"startswith"];
        if(startswithArg){
            boolToStdout([valueArg startswith:startswithArg]);
        }
        
        // join
        NSString *joinArg = [inputArgs objectForKey:@"join"];
        if(joinArg){
            stringToStdout([valueArg join:[joinArg componentsSeparatedByString:@":"]]);
        }
        
        // replace
        NSString *searchArg = [inputArgs objectForKey:@"search"];
        NSString *replaceArg = [inputArgs objectForKey:@"replace"];
        if(replaceArg && searchArg){
            stringToStdout([valueArg replace:searchArg with:replaceArg]);
        }
        
        // split
        NSString *splitArg = [inputArgs objectForKey:@"split"];
        if(splitArg){
            arrayToStdout([valueArg split:splitArg]);
        }
    }
    
    // upper
    NSString *upperArg = [inputArgs objectForKey:@"upper"];
    if(upperArg){
        stringToStdout([upperArg upper]);
    }
    
    // isupper
    NSString *isupperArg = [inputArgs objectForKey:@"isupper"];
    if(isupperArg){
        boolToStdout([isupperArg isupper]);
    }
    
    // lower
    NSString *lowerArg = [inputArgs objectForKey:@"lower"];
    if(lowerArg){
        stringToStdout([lowerArg lower]);
    }
    
    // islower
    NSString *islowerArg = [inputArgs objectForKey:@"islower"];
    if(islowerArg){
        boolToStdout([islowerArg islower]);
    }
    
    // title
    NSString *titleArg = [inputArgs objectForKey:@"title"];
    if(titleArg){
        stringToStdout([titleArg title]);
    }
    
    // istitle
    NSString *istitleArg = [inputArgs objectForKey:@"istitle"];
    if(istitleArg){
        boolToStdout([istitleArg istitle]);
    }
    
    // capitalize
    NSString *capitalizeArg = [inputArgs objectForKey:@"capitalize"];
    if(capitalizeArg){
        stringToStdout([capitalizeArg capitalize]);
    }
    
    // strip
    NSString *stripArg = [inputArgs objectForKey:@"strip"];
    if(stripArg){
        stringToStdout([stripArg strip]);
    }
    
    // splitlines
    NSString *splitlinesArg = [inputArgs objectForKey:@"splitlines"];
    if(splitlinesArg){
        arrayToStdout([splitlinesArg splitlines]);
    }
    
    [pool drain];
    return 0;
}
