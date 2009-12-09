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

NSString *argStringForKey(NSString *key){
    //spaces are striped out of command line args so we encode them with %20
    return [[[NSUserDefaults standardUserDefaults] objectForKey:key] stringByReplacingOccurrencesOfString:@"%20" withString:@" "];
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    
    NSUserDefaults *inputArgs = [NSUserDefaults standardUserDefaults];
    
    NSString *valueArg = argStringForKey(@"value");
    if(valueArg){
        // center
        NSNumber *centerArg = [inputArgs objectForKey:@"center"];
        if(centerArg){
            NSString *fillcharArg = argStringForKey(@"fillchar");
            if(fillcharArg){
                stringToStdout([valueArg center:[centerArg intValue] fillchar:fillcharArg]);
            }
            else{
                stringToStdout([valueArg center:[centerArg intValue]]);
            }
        }
        
        // endswith
        NSString *endswithArg = argStringForKey(@"endswith");
        if(endswithArg){
            boolToStdout([valueArg endswith:endswithArg]);
        }
        
        // startswith
        NSString *startswithArg = argStringForKey(@"startswith");
        if(startswithArg){
            boolToStdout([valueArg startswith:startswithArg]);
        }
        
        // join
        NSString *joinArg = argStringForKey(@"join");
        if(joinArg){
            stringToStdout([valueArg join:[joinArg componentsSeparatedByString:@":"]]);
        }
        
        // replace
        NSString *searchArg = argStringForKey(@"search");
        NSString *replaceArg = argStringForKey(@"replace");
        if(replaceArg && searchArg){
            stringToStdout([valueArg replace:searchArg with:replaceArg]);
        }
        
        // split
        NSString *splitArg = argStringForKey(@"split");
        if(splitArg){
            arrayToStdout([valueArg split:splitArg]);
        }
    }
    
    // upper
    NSString *upperArg = argStringForKey(@"upper");
    if(upperArg){
        stringToStdout([upperArg upper]);
    }
    
    // isupper
    NSString *isupperArg = argStringForKey(@"isupper");
    if(isupperArg){
        boolToStdout([isupperArg isupper]);
    }
    
    // lower
    NSString *lowerArg = argStringForKey(@"lower");
    if(lowerArg){
        stringToStdout([lowerArg lower]);
    }
    
    // islower
    NSString *islowerArg = argStringForKey(@"islower");
    if(islowerArg){
        boolToStdout([islowerArg islower]);
    }
    
    // title
    NSString *titleArg = argStringForKey(@"title");
    if(titleArg){
        stringToStdout([titleArg title]);
    }
    
    // istitle
    NSString *istitleArg = argStringForKey(@"istitle");
    if(istitleArg){
        boolToStdout([istitleArg istitle]);
    }
    
    // capitalize
    NSString *capitalizeArg = argStringForKey(@"capitalize");
    if(capitalizeArg){
        stringToStdout([capitalizeArg capitalize]);
    }
    
    // strip
    NSString *stripArg = argStringForKey(@"strip");
    if(stripArg){
        stringToStdout([stripArg strip]);
    }
    
    // lstrip
    NSString *lstripArg = argStringForKey(@"lstrip");
    if(lstripArg){
        NSString *charsArg = argStringForKey(@"chars");
        if(charsArg){
            stringToStdout([lstripArg lstrip:charsArg]);            
        }
        else{
            stringToStdout([lstripArg lstrip]);
        }
    }

    // rstrip
    NSString *rstripArg = argStringForKey(@"rstrip");
    if(rstripArg){
        NSString *charsArg = argStringForKey(@"chars");
        if(charsArg){
            stringToStdout([rstripArg rstrip:charsArg]);            
        }
        else{
            stringToStdout([rstripArg rstrip]);
        }
    }
    
    // splitlines
    NSString *splitlinesArg = argStringForKey(@"splitlines");
    if(splitlinesArg){
        arrayToStdout([splitlinesArg splitlines]);
    }
    
    [pool drain];
    return 0;
}
