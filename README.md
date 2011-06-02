Currently only functions from the python string class have been implemented.

NSString+PyStr
--------
* `(NSString *)center:(NSInteger)width;`
* `(NSString *)center:(NSInteger)width fillchar:(NSString*)fillchar;`
* `(BOOL)endswith:(NSString *)endswith;`
* `(BOOL)startswith:(NSString *)startswith;`
* `(NSString *)capitalize;`
* `(NSString *)title;`
* `(BOOL)istitle;`
* `(NSString *)upper;`
* `(BOOL)isupper;`
* `(NSString *)lower;`
* `(BOOL)islower;`
* `(NSString *)join:(NSArray *)joinArray;`
* `(NSString *)replace:(NSString *)searchString with:(NSString *)repalceString;`
* `(NSArray *)splitlines;`
* `(NSArray *)split:(NSString *)splitString;`
* `(NSString *)strip;`
* `(NSString *)lstrip;`
* `(NSString *)rstrip;`
* `(NSString *)lstrip:(id)chars;`
* `(NSString *)rstrip:(id)chars;`

ObjcPyTest
--------
ObjcPyTest is an xcode project for building command line applications for ObjcPy that allow it to be tested with pythons unittesting. This testing method guarantees that the results matchup between python and ObjcPy.

ObjcPy is distributed under the [MIT License](http://www.opensource.org/licenses/mit-license.php), read the license file for more licensing information.