import os, subprocess

root = os.path.join(os.path.dirname(__file__), 'build','Debug')

class TestPyError(Exception):
    def __init__(self, command, stderr):
        self.command = command
        self.stderr = stderr
    def __str__(self):
        return '%s\n%s' % (self.command, self.stderr)

def runCommand(command, args):
    commandAndArgs = '%s %s' % (os.path.join(root, command), args)
#    print commandAndArgs
    proc = subprocess.Popen(commandAndArgs, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = proc.communicate()
    if stderr != '':
        raise TestPyError(commandAndArgs, stderr)
    return stdout
