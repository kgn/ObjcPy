import unittest
import TestPyHelper

command = 'TestPyStr'

class testCenter(unittest.TestCase):
    def runAssert(self, *input):
        value, center, fillchar = input
        if fillchar != None:
            pyResult = value.center(center, fillchar)
            args = '-value "%s" -center %d -fillchar "%s"' % (value, center, fillchar)
        else:
            pyResult = value.center(center)
            args = '-value "%s" -center %d' % (value, center)
        self.assertEqual(str(TestPyHelper.runCommand(command, args)), pyResult)
    
    def test_a_2_star(self):
        self.runAssert('a', 2, '*')
        
    def test_a_3_star(self):
        self.runAssert('a', 3, '*')
        
    def test_ab_3_dot(self):
        self.runAssert('ab', 3, '.')
        
    def test_ab_4_dot(self):
        self.runAssert('ab', 4, '.')
        
    def test_ab_13_star(self):
        self.runAssert('ab', 13, '*')
        
    def test_ab_0_star(self):
        self.runAssert('ab', 0, '*')
        
    def test_TheBook_20(self):
        self.runAssert('The Book', 20, None)
        
    def test_Dogs_0(self):
        self.runAssert('Dogs', 0, None)
        
    def test__0(self):
        self.runAssert('', 0, None)
        
class testEndswith(unittest.TestCase):
    def runAssert(self, *input):
        value, endswith = input
        pyResult = value.endswith(endswith)
        args = '-value "%s" -endswith "%s"' % (value, endswith)
        self.assertEqual(int(TestPyHelper.runCommand(command, args)), pyResult)
    
    def test_TheBook_Book(self):
        self.runAssert('The Book', 'Book')
        
    def test__empty(self):
        self.runAssert('', 'empty')
        
    def test_cooktheeggs_egg(self):
        self.runAssert('cook the eggs', 'egg')
        
    def test_himom__(self):
        self.runAssert('hi mom', '')
        
    def test___(self):
        self.runAssert('', '')
        
    def test_abc_abc_(self):
        self.runAssert('abc', 'abc')
        
class testStartswith(unittest.TestCase):
    def runAssert(self, *input):
        value, startswith = input
        pyResult = value.startswith(startswith)
        args = '-value "%s" -startswith "%s"' % (value, startswith)
        self.assertEqual(int(TestPyHelper.runCommand(command, args)), pyResult)
    
    def test_TheBook_The(self):
        self.runAssert('The Book', 'The')
        
    def test__empty(self):
        self.runAssert('', 'empty')
        
    def test_cookscook_cook(self):
        self.runAssert('cooks cook', 'cook')
        
    def test_himom__(self):
        self.runAssert('hi mom', '')
        
    def test___(self):
        self.runAssert('', '')
        
    def test_abc_abc_(self):
        self.runAssert('abc', 'abc')
        
class testUpper(unittest.TestCase):
    def runAssert(self, input):
        pyResult = input.upper()
        args = '-upper "%s"' % input
        self.assertEqual(TestPyHelper.runCommand(command, args), pyResult)
    
    def test_TheBook(self):
        self.runAssert('  The Book')
        
    def test_YEAHBOY(self):
        self.runAssert('   YEAH BOY')
        
    def test_littlewomen(self):
        self.runAssert('little women')
        
    def test_(self):
        self.runAssert('')
        
class testIsupper(unittest.TestCase):
    def runAssert(self, input):
        pyResult = input.isupper()
        args = '-isupper "%s"' % input
        self.assertEqual(int(TestPyHelper.runCommand(command, args)), pyResult)
    
    def test_CamelCase(self):
        self.runAssert('Camel Case')
        
    def test_YELL(self):
        self.runAssert('YELL  ')
        
    def test_smallpeople(self):
        self.runAssert('small people  ')
        
    def test_(self):
        self.runAssert('')
        
class testLower(unittest.TestCase):
    def runAssert(self, input):
        pyResult = input.lower()
        args = '-lower "%s"' % input
        self.assertEqual(TestPyHelper.runCommand(command, args), pyResult)
    
    def test_BigTEXT(self):
        self.runAssert('Big TEXT')
        
    def test_YELL(self):
        self.runAssert('  YELL')
        
    def test_smallpeople(self):
        self.runAssert('small people  ')
        
    def test_(self):
        self.runAssert('')
        
class testIslower(unittest.TestCase):
    def runAssert(self, input):
        pyResult = input.islower()
        args = '-islower "%s"' % input
        self.assertEqual(int(TestPyHelper.runCommand(command, args)), pyResult)
        
    def test_CamelCase(self):
        self.runAssert('Camel Case')
        
    def test_WHYRWEYELLING(self):
        self.runAssert('WHY R WE YELLING  ')
        
    def test_smallpeople(self):
        self.runAssert('    small people')
        
    def test_(self):
        self.runAssert('')
        
class testTitle(unittest.TestCase):
    def runAssert(self, input):
        pyResult = input.title()
        args = '-title "%s"' % input
        self.assertEqual(TestPyHelper.runCommand(command, args), pyResult)
        
    def test_makeMEintoaTitle(self):
        self.runAssert('make ME into a Title')
        
    def test_upperwithspaces(self):
        self.runAssert('   upper with spaces   ')
        
    def test_(self):
        self.runAssert('')
        
class testIstitle(unittest.TestCase):
    def runAssert(self, input):
        pyResult = input.istitle()
        args = '-istitle "%s"' % input
        self.assertEqual(int(TestPyHelper.runCommand(command, args)), pyResult)
        
    def test_alllower(self):
        self.runAssert(' all lower')
        
    def test_TheQuickBrownFox(self):
        self.runAssert('The Quick Brown Fox ')
        
    def test_(self):
        self.runAssert('')
        
class testCapitalize(unittest.TestCase):
    def runAssert(self, input):
        pyResult = input.capitalize()
        args = '-capitalize "%s"' % input
        self.assertEqual(TestPyHelper.runCommand(command, args), pyResult)
        
    def test_leadingSpace(self):
        self.runAssert(' all lower')
        
    def test_TheQuickBrownFox(self):
        self.runAssert('The Quick Brown Fox ')
        
    def test_(self):
        self.runAssert('')
        
class testJoin(unittest.TestCase):
    def runAssert(self, joinStr, input):
        pyResult = joinStr.join(input)
        args = '-join "%s" -value "%s"' % (':'.join(input), joinStr)
        self.assertEqual(TestPyHelper.runCommand(command, args), pyResult)
        
    def test_comma_items(self):
        self.runAssert(',', ('item1', 'item2', 'item3'))
        
    def test_colon_123(self):
        self.runAssert(':', ('1', '2', '3'))
        
    def test__abc(self):
        self.runAssert('', ('a', 'b', 'c'))
        
    def test_colon_1(self):
        self.runAssert(':', ('1'))
        
    def test__(self):
        self.runAssert('', ())
        
class testReplace(unittest.TestCase):
    def runAssert(self, *input):
        search, replace, value = input
        pyResult = value.replace(search, replace)
        args = '-search "%s" -replace "%s" -value "%s"' % (search, replace, value)
        self.assertEqual(TestPyHelper.runCommand(command, args), pyResult)
        
    def test_A_star_ABACADA(self):
        self.runAssert('A', '*', 'ABACADA')
        
    def test__star_ABACADA(self):
        self.runAssert('', '*', 'ABCDEF')
        
    def test__colon_star(self):
        self.runAssert(':', '*', ':::ab::::')
        
    def test__star_(self):
        self.runAssert('', '*', '')
        
    def test_a__abcabd(self):
        self.runAssert('a', '', 'abcabd')
        
    def test___(self):
        self.runAssert('', '', '')
        
class testSplit(unittest.TestCase):
    def runAssert(self, *input):
        splitString, value = input
        pyResult = ':'.join(value.split(splitString))
        args = '-split "%s" -value "%s"' % (splitString, value)
        self.assertEqual(TestPyHelper.runCommand(command, args), pyResult)
        
    def test_splitOnDots(self):
        self.runAssert('.', 'split.this..on.dots')
        
    def test_splitOnA(self):
        self.runAssert('a', 'howdy partner')
        
    def test__(self):
        self.runAssert('_', '')
        
class testStrip(unittest.TestCase):
    def runAssert(self, input):
        pyResult = input.strip()
        args = '-strip "%s"' % input
        self.assertEqual(TestPyHelper.runCommand(command, args), pyResult)
        
    def test_howdyPartner(self):
        self.runAssert('    howdy partner    ')
        
    def test_a(self):
        self.runAssert('a')
        
class testSplitlines(unittest.TestCase):
    def runAssert(self, input):
        pyResult = ':'.join(input.splitlines())
        args = '-splitlines "%s"' % input
        self.assertEqual(TestPyHelper.runCommand(command, args), pyResult)
        
    def test_howdyPartner(self):
        self.runAssert('howdy partner')
        
    def test_newline(self):
        self.runAssert('item1\nirem2\nitem3')
        
    def test_creturn(self):
        self.runAssert('item1\rirem2\ritem3')
        
    def test_mixed(self):
        self.runAssert('item1\r\nirem2\n\ritem3')
        
    def test_newline_end(self):
        self.runAssert('item1\nirem2\nitem3\n')
        
    def test_creturn_end(self):
        self.runAssert('item1\rirem2\ritem3\r')
        
    def test_newline_start(self):
        self.runAssert('\nitem1\nirem2\nitem3')
        
    def test_creturn_start(self):
        self.runAssert('\ritem1\rirem2\ritem3')
        
if __name__ == "__main__":
    unittest.main()