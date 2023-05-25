#!/usr/bin/env python3
import os
import subprocess
import time
import traceback
from typing import List, Tuple, Union

# Execute this from "mtp" folder

# data_files = ['8d076db69298e60e8c3404c0fb421e25acdb38aa85bbb48e045f56e9f25c98fcm1.gms',
#               '22a95635d165f2369736c07928f2b3b28b7918b905e2acc034e10eadcc482a12m1.gms',
#               '525c57589abb519b1dd8e3306fe8dbf5dd11779d1d007854a678db8d7e18171m1.gms',
#               '650c33ae19e2456cbd727bd8ff810bc9521987e1f5c24218d6e933603fae76b8m1.gms',
#               'b9a3778f646d02a413e7bf7a63ebeba406b6047d2447906866d03c20f3516e6am1.gms',
#               '8fab09d4248635ec01dffa5cb9ac874783146f6c50265c0621b5509bff2880c6m1.gms',
#               '93dea423ed4a46f02198c0188cad86dac4361360978228f5990a027ea1211220m1.gms',
#               'ed96a4e938264ce4c2f20d4052b1dd9d919405a57d5a47192d2ae4ee6f9902b7m1.gms',
#               '8a2153652abd8b40385c36763edaccc0a37f6729df101f84cd99515650c53053m1.gms',
#               'e0579acb9986c7b7688d6ddcda0feda6a161605b0095e62dda606d47c22eef5m1.gms']
data_files = ['8fab09d4248635ec01dffa5cb9ac874783146f6c50265c0621b5509bff2880c6m1.gms']

def run_command(cmd: str, debug_print: bool = False) -> Tuple[bool, str]:
    # REFER: Context-Search-fms
    if debug_print:
        print(f'DEBUG: COMMAND: `{cmd}`')
    try:
        # NOTE: Not using the below line of code because "sh" shell does not seem to properly parse the command
        #       Example: `kill -s SIGINT 12345`
        #                did not work and gave the following error:
        #                '/bin/sh: 1: kill: invalid signal number or name: SIGINT'
        #       The error logs of testing has been put in "REPO/logs/2022-01-22_ssh_kill_errors.txt"
        # status_code, output = subprocess.getstatusoutput(cmd)
        output = subprocess.check_output(['/usr/bin/bash', '-c', cmd], stderr=subprocess.STDOUT,
                                         shell=False).decode().strip()
        if debug_print:
            print(output)
        return True, output
    except Exception as e:
        print(f'EXCEPTION OCCURRED (cmd=`{cmd}`), will return "0" as the output')
        # print(e)
        # print(traceback.format_exc())
    if debug_print:
        print("0")
    return False, "0"


def run_command_get_output(cmd: str, debug_print: bool = False) -> str:
    return run_command(cmd, debug_print)[1]
    # subprocess.run([cmd])

time_option = 300
output_dir = "/home/manal/Ipopt5minRuns"
#run_command_get_output(f'mkdir -p "{output_dir}"')
engine_path = '/opt/gams/gams42.3_linux_x64_64_sfx/gams'
for ith_data_file in data_files:
    short_model_name = '5min'
    short_data_file_name = ith_data_file
    short_uniq_combination = f'{short_model_name}_{short_data_file_name}'
    print(short_model_name, short_data_file_name, short_uniq_combination)
    run_command_get_output(
        rf'''
         nohup -d -s 'autorun_{short_uniq_combination}'
         "{engine_path}" "{ith_data_file}" reslim="{time_option}" > "{output_dir}/{short_uniq_combination}" 2>&1 <<EOF '
        '''
    )






