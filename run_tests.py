#!/usr/bin/python3
import sys
import subprocess

config = dict()
veriwasm_path = sys.argv[1]

# read configuration
global_size = 0
call_size = 0
for line in open('config.txt', 'r'):
    if 'global data size:' in line:
        global_size = int(line.split()[3])
    elif 'indirect call table size:' in line:
        call_size = int(line.split()[4])
    elif '.exe' in line:
        name = line.strip()
        config[name] = (global_size, call_size)
        global_size = 0
        call_size = 0

# run verification on every binary 
passed = 0
for fname, (global_size, call_size) in config.items():
    print('Verifying "{}" ...'.format(fname), end=' ')
    cmd = '{}/target/debug/veriwasm --wamr -i {} -c {} -g {}'.format(veriwasm_path, fname, call_size, global_size)
    result = subprocess.run(cmd.split(), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if result.returncode != 0:
        print('FAILED ({})'.format(cmd))
        print('\t'+result.stderr.decode('ascii').split('\n')[-3])
    else:
        print('PASSED')
        passed += 1

print('--------------------------------')
print('  Results: {}/{} tests passed\n'.format(passed, len(config)))

