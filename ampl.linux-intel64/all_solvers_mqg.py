#!/usr/bin/env python3
import os
import subprocess
import time
import traceback
from typing import List, Tuple, Union
 
 
# Execute this from "mtp" folder
solver_list = ["mqg"]
 
models_dir = "../Files/Models"
model_to_input_mapping = {
   "m2_basic2_v2.R" : "../Files/Data/m1_m2",
}
data_files = [
   'd1_Sample_input_cycle_twoloop.dat',
   'd2_Sample_input_cycle_hanoi.dat',
   'd3_Sample_input_double_hanoi.dat',
   'd4_Sample_input_triple_hanoi.dat',
   'd5_Taichung_input.dat',
   'd6_HG_SP_1_4.dat',
   'd7_HG_SP_2_3.dat',
   'd8_HG_SP_3_4.dat',
   'd9_HG_SP_4_2.dat',
   'd10_HG_SP_5_5.dat',
   'd11_HG_SP_6_3.dat',
]
 
 
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
       output = subprocess.check_output(['/usr/bin/bash', '-c', cmd], stderr=subprocess.STDOUT, shell=False).decode().strip()
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

 
for solver in solver_list:
    output_dir = "./Files/knitro_correct_output/1hours/" + solver
    run_command_get_output(f'mkdir -p "{output_dir}"')
    engine_path = '/home/manal/Downloads/MTP/minotaur/build/bin/'+solver;
    for model_name, data_path_prefix in model_to_input_mapping.items():
       for ith_data_file in data_files:
           short_model_name = model_name[:model_name.find('.')]
           short_data_file_name = ith_data_file[:ith_data_file.find('_')]
           short_uniq_combination = f'{short_model_name}_{short_data_file_name}'
           print(short_model_name, short_data_file_name, short_uniq_combination)
           run_command_get_output(
               rf'''
       nohup -d -s 'autorun_{short_uniq_combination}'; ./ampl > "{output_dir}/{short_uniq_combination}.txt" 2>&1 << EOF
       reset;
       model {models_dir}/{model_name}
       data {data_path_prefix}/{ith_data_file}
       option solver "{engine_path}";
       option {solver}_options "--presolve 1 --log_level 6 --eval_within_bnds 1" ;
       solve;
    EOF
               '''
           )
      
      
 
 

