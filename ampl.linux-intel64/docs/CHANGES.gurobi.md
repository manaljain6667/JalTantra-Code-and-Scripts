# Summary of recent updates to Gurobi for AMPL

## 20211209
- Update to Gurobi 9.5.
  - New keywords: *presos1enc*, *presos2enc*, *nlpheur*, *worklimit*, *memlimit*, *liftprojectcuts*, 
    *lpwarmstart* 
  - New input suffixes on variables: *poolignore*, *iisforce*
  - New input suffixes on constraints: *iisforce*
  - New output suffixes on problem: *concurrentwinmethod*, *maxvio*, *work*, enabled by corresponding keywords

## 20211001
- A bug that caused an incoming basis to be ignored when no constraints were in the basis.
- Possible problem in the licencing routines for computer with many MAC addresses.

## 20210820
- A bug involving a defined variable that references another defined variable and that is shared by two or more objectives or constraints.
- Adjust the license check to be more robust when there are many solver threads.
- Possible issue with unbounded rays computation.

## 20210705
- Update to Gurobi 9.1.2, which contains many bug fixes.

## 20210614
- Relink with ASL version 20210613 to fix a fault with indicator constraints.
 
## 20201230
- Relink with Gurobi 9.1.1, which contains many bug fixes.

## 20201130
- Update to Gurobi 9.1, which contains performance improvements and bug fixes.
- New possible value (-1) to suffix lazy to specify pre-defined user cuts; there are some limitations
  on the functionality due to some bugs in the current version of the gurobi library.
- Keywords integralityfocus, norelheurtime, norelheurwork (see "gurobi -=" for details).

## 20201107
- Relinked with ASL 20201107, which contains various bug fixes.
- [Windows] Relinked to avoid false positive reports from many antivirus.

## 20201005
- [MacOS] Added support for older version of MacOS.

## 20200921
- Fixed an error that was affecting the IIS retrieval of an unfeasible non-linear model .
  solved via nonconvex=2 and iisfind=1, 
- Fixed some alignment issues in the -= output.

## 20200914
- Kappa suffix now returns real value.

## 20200905
- Update to Gurobi 9.0.3, which has various bug fixes.
- New keyword kappa (see "gurobi-=" for details).

## 20200504
- Update to Gurobi 9.0.2, which has various bug fixes.

## 20191216
- When "ams_stub=..." and "ams_mode=2" are specified and one solution is found, set npool = 1 (rather then 0).

## 20191211
- Allow quadratic equality constraints when "nonconvex=2" is specified.

## 20191202
- Update to Gurobi 9.0.0. 
- New keywords: bqpcuts, nonconvex, relaxliftcuts, rltcuts. See the "gurobi -=" output for details.

## 20190908
- Relink to ignore any LOGWAIT keywords in the ampl.lic or ampl.netlic file.

## 20190430
- Allow alternate MIP solutions to be written (when available) even if timelim is specified and is reached.

## 20190315
- Relink to fix bugs with "objrep" when several objectives can be adjusted.

## 20181120
- Relink to ignore HEARTBEAT lines in the ampl.lic file.

## 20181023
- Adjust copyright text in "gurobi -v" output.

## 20181017
- Update to Gurobi 8.1. 
- New possible value 2 for "preqlinearize". See the "gurobi -=" output for details.
- Fix possible trouble (e.g., a fault) when "objrep" causes one or more constraints, other then the last, to be removed.

## 20180601
- For consistency with the cplex driver, add keywords poolgap, poolgapabs, and poolstub as synonyms for ams_eps, ams_epsabs, and ams_stub, respectively, and return in suffix npool the number of alternative MIP solution files written. These files have names obtained by appending "1.sol", "2.sol", etc., to ams_stub. Suffix npool is on the objective and problem. When ams_stub (or poolstub) is specified but ams_mode (or poolsearchmode) is not, assume ams_mode=2.

## 20180425
- Update to Gurobi 8.0. 
- New keywords cloudpriority, partitionplace, server_insecure; withdrawn keyword: server_port. See the "gurobi -=" output for details.

## 20171218
- Relink to fix a possible fault introduced 20171215.

## 20171215
- Relink to fix possible trouble with quadratic objectives and constraints involving defined variables.
- When multiobj=1 and there are several objectives, report the value of each objective in the solve_message.

## 20171211
- Adjust treatment of multiobj=1 and its description. When asked to deal with multiple objectives, Gurobi apparently ignores the originally supplied objective, requiring it to be supplied a second time. Moreover, all objectives must be linear. An attempt to supply, say, a quadratic objective when multiobj=1 now results in new solve_result_num value 543. This update also fixes some possible (probably unlikely) trouble with quadratic objectives and constraints.

## 20170712
- Update to Gurobi 7.5. 
- New keyword startnodelimit. When multiobj=1, objective-specific convergence tolerances and method values may be assigned via keywords of the form obj_n_name, such as obj_1_method for assigning a method value for the first objective.

## 20170707
- Tweak so pool_* keywords should work when a suitable Gurobi Compute Server is available. New solve_result_num values 540, 541, 542 for trouble with Gurobi Compute servers.

## 20170503
- Update to Gurobi 7.0.2, which has some bug fixes.

## 20170429
- Relink to fix bugs converting

        var o;
        minimize O: o;
        s.t. c: o = q(x);

to

        minimize O: q(x);

where q(x) is quadratic. Linear and constant terms were sometimes mishandled.

## 20170419
- Fix two bugs with "multiobj=1".

## 20170307
- Fix bugs setting solve_result_num values 101, 102, 103, 502, 524. 
- Add possible solve_result_num values 104 and 570. 
- Fix a fault that happened if bestbndstop or bestobjstop was reached and a solution was not available.

## 20170116
- Fix a glitch with multiple objectives: the objective used was not transmitted (via the .sol file) to the AMPL session.

## 20161108
- Add keywords miqcpmethod and premiqcpform. See the "gurobi -=" output for details.

## 20161026
- Update to Gurobi 7.0. 
- New keywords: ams_mode, bestbndstop, bestobjstop, cloudid, cloudkey, cloudpool, degenmoves, infproofcuts, multiobj, multiobjmethod, poolsearchmode, poolsolutions. See the "gurobi -=" output for details.

## 20160624
- Update to Gurobi 6.5.2, which has some bug fixes.

## 20160608
- Fix a glitch with the Gurobi library accompanying the Linux binary.

## 20160607
- Allow "serverlic" file to accept "computeserver" as a synonym for "server" and "password" as a synonym for "server_password".

## 20160329
- Update to Gurobi 6.5.1, which presumably has some bug fixes.

## 20160310
- Try to give a better error message (than "invalid license") when the Gurobi compute server is used and no license is available.

## 20160118
- Replace solve_result_num value 600 with 405 or 415 (for interrupted with or without a feasible solution, respectively) and add new solve_result_num value 411, 412, 413 for iteration, node, and time limits without a feasible solution.

## 20151209
- Relink to fix a bug with quadratic objectives or constraints with diagonal elements that sum to zero and whose rows contain nonzeros to the left but not to the right of the diagonal.

## 20151125
- Fix a glitch with "warmstart": the default and upper limit values were interchanged.
- For Linux binaries, add the directory containing the binary to the library search rules.

## 20151120
- Adjust message about Gurobi not handling free rows.

## 20151029
- Update to Gurobi 6.5. 
- New possible values 2, 3, and 4 for keyword "warmstart". See the "gurobi -=" output for details.

## 20151026
- Relink to fix a bug with "objrep" when the problem has several objectives.

## 20151005
- Relink to fix a fault with some quadratic objectives or constraints.

## 20150829
- Relink to fix a bug with quadratic objectives and constraints in which cancellation causes fewer than the generic number of quadratic nonzeros.

## 20150630
- Fix some possible trouble with a single-use license.

## 20150529
- In Linux bundles, remove "gurobi" shell script and replace it with the former gurobix; the 32-bit Linux version remains at Gurobi 5.0.2. In gurbodi.doc bundles, update INSTALLING section of README.gurobi.

## 20150512
- Update to Gurobi 6.0.4, which has some bug fixes. Gurobi no longer runs under Windows XP.

## 20150501
- Update to Gurobi 6.0.3, which has some bug fixes.

## 20150427
- Fix a bug with "objrep" on problems with quadratic constraints.
- Fix a rarely seen licensing glitch.

## 20150422
- Arrange to return iis_table (for symbolic names of .iis values) when returning an IIS that only involves constraints. Hitherto, iis_table was only returned when returning an IIS that involved some variables.

## 20150324
- Correct description of keyword "threads", which applies to the barrier algorithm as well as to MIP problems.

## 20150304
- Add keyword "pool_distmip" for specifying how many machines from the server pool (if specified by pool_servers) should be used for solving each MIP instance.

## 20150228
- Rework logic for suffixes absmipgap, bestbound, and relmipgap so .bestbound can be returned in more cases.

## 20150227
- Update for Gurobi 6.0.2, which has some bug fixes.

## 20150226
- When suffixes absmipgap, bestbound, and/or relmipgap are requested, return them (as the description of "return_mipgap" in the "gurobi -=" output says they should be) with infinite values if no integer feasible solution has yet been found. Expand the description of "bestbound" in the "gurobi -=" output.
- Adjust MacOSX portion of README.gurobi.

## 20150225
- Relink the MacOSX "gurobix" so it will find libgurobi60.so (without adjustments to $DYLD_LIBRARY_PATH) when both appear in the same directory.

## 20150209
- When writeprob=... is specified and variable or constraint names are available (via option gurobi_auxfiles), pass them to Gurobi so they appear in the file or files written for writeprob keywords.

## 20150102
- When server=... is specified, replay other option settings so they affect the new Gurobi environment.

## 20141223
- Relink to fix a fault that was possible under unusual conditions.

## 20141209
- Add scale=2 to the description of scale in the -= output.

## 20141204
- Tweak to free some scratch memory on quadratic problems; should be invisible, aside perhaps from reduced memory requirements.

## 20141124
- Updates for Gurobi 6.0. 
- New keywords:

      lazy
      pl_bigm
      pool_mip
      pool_password
      pool_servers

  See the output of "gurobi -=" for details.

- On MIP problems, suppress returning a basis or solution sensitivities unless a feasible solution has been found. New option basisdebug: specifying basisdebug=1 restores the old behavior of trying to return a basis and/or solution sensitivities (if requested) even when the problem is infeasible or unbounded. Specifying basisdebug=2 causes the "basis" and "solnsense" keywords to be honored only if an optimal solution is found.

## 20141013
- Relink macosx binary so licenses can consider both hostname and local hostname.

## 20140828
- Fix a glitch seen only on a bizarre MS Windows system that got eror message "Bad LOCAL_MGR = 0.0.0.0" with a floating license. Only the MS Windows bundles are updated. If you have not seen the "Bad LOCAL_MGR" message, you do not need this update. With the updated gurobi.exe, invoking "gurobi -v" will show ASL(## 20140826).

## 20140528
- Update to Gurobi 5.6.3, which has some bug fixes; "gurobi -v" should show "driver (20140508)", and the updated downloads have names of the form gurobi.*.20140508.*.

## 20140324
- Add ".rew" and ".rlp" to the possible suffixes used with "writeprob".

## 20140313
- Fix a glitch (possible fault) sometimes seen with objrep.

## 20140## 205
- Update to Gurobi 5.6.2, which has some bug fixes; "20140205" is the ASL date that "gurobi -v" should show.

## 20131114
- Fix a glitch, probably introduced in version 20131003, that kept "cuts" from being recognized in $gurobi_options.

## 20131113
- Fix a typo in the "gurobi -=" output: change "tuneparbase" to "tunebase" (twice, in the description of "tunebase").

## 20131101
- Add keyword "objrep", which (as now shown in the output of "gurobi -=") tells whether to replace

        minimize obj: v;
with

        minimize obj: f(x)
when variable v appears linearly in exactly one constraint of the form

        s.t. c: v >= f(x);
or

        s.t. c: v == f(x);

Possible objrep values:
        0 = no
        1 = yes for v >= f(x)
        2 = yes for v == f(x) (default)
        3 = yes in both cases

For maximization problems, ">= f(x)" is changed to "<= f(x)" in the description above.

## 20131023
- Ignore case in MAC addresses during license checks (an issue rarely seen). When ending execution under a floating license, try to read a reply from the license manager to circumvent bug sometimes seen in MS Windows.

## 20131003
- Update to Gurobi 5.6. 
- New keywords: disconnected, pool_mip, pool_password, pool_servers, pool_tunejobs, presos1bigm, presos2bigm. See the output of "gurobi -=" for details.

## 20130530
- Fix a bug with ignoring SOS1 sets of one element (specified with .sosno).

## 20130419
- Correct the descriptions of "aggfill" (default value) and "cutoff" in the "-=" output. When the objective is no better than cutoff, report "objective cutoff" rather than "cutoff reached".

## 20130402
- Work around a bug in Gurobi 5.5.0 that caused a fault when a valid ampl.lic file was not found. (This does not affect course licenses.)

## 20130328
- Update to Gurobi 5.5.0. 
- New keywords: concurrentmip, feasrelaxbigm, impstartnodes, numericfocus, seed, server, server_password, server_port, server_priority, server_timeout, serverlic, tunebase, tuneoutput, tuneresults, tunetimelimit, tunetrials. For details, invoke "gurobi -=".

## 20130206
- Fix a possible fault, introduced 20120504 (for Gurobi versions >= 5), with problems having a dual initial guess but no incoming basis.

## 20130204
- Fix an off-by-one error in the description of sos2 in the -= output.

## 20130109
- Update to Gurobi 5.1.0, which has significantly improved performance on some MIP problems, but does not have a 32-bit Linux version. For now, the 32-bit Linux version remains at Gurobi version 5.0.2, but later it will be withdrawn.

## 20121204
- Update to Gurobi 5.0.2, which has some bug fixes.

## 20121116
- Relink to fix a fault on problems with nonlinear piecewise-linear terms; such problems now elicit an error message.

## 20121101
- Relink to fix a glitch (possible fault) with problems having both nonconvex piecewise-linear terms and quadratic constraints. (If "gurobi -v" shows "ASL(yyyymmdd)" with yyyymmdd >= ## 20121101, then you have this bug fix.)
- Fix a bug with problems involving both nonconvex piecewise-linear terms and range constraints. The adjustments for ranges were wrong, resulting in the error message "Index is out of range" or other trouble.

## 20121012
- Relink macosx64 version in hopes of working with MacOSX versions as old as 10.4.

## 20121006
- Add "version" keyword (a single-word phrase), which causes version details to be printed before the problem is solved.

## 20121005
- Fix a glitch with discarding SOS1 sets of size 1 and SOS2 sets of size 2 when explicitly specified by suffixes sosno and ref (a bad idea -- it is much less error prone to use AMPL's <<...>> notation for piecewise-linear terms).

## 20120828
- On MIP problems, when basis >= 2 (the default) and method >= 2 (explicitly specified in $gurobi_options), avoid an unnecessary barrier-solver call when trying to return the requested basis. Adjust the description of "method" and remove "rootmethod", which went away in Gurobi 4.0.

## 20120713
- Update to Gurobi 5.0.1, which has some bug fixes.

## 20120606
- Fix a bug in providing a dual initial guess (when available from a previous solve) in problems with quadratic constraints. The bug led to the message "Index out of range for attribute 'DStart'."

## 20120524
- Fix a typo in the "gurobi -=" output.

## 20120511
- Fix a bug (fault) in supplying a warm start.

## 20120504
- Update to Gurobi 5.0, which handles quadratic constraints and runs faster on some problems.

## 20120320
- Adjust license-check in Linux versions for use with FreeBSD.

## 20111209
- Update to Gurobi 4.6.1. No new functionality, but internal changes may affect performance on some problems.

## 20111120
- Relink to fix a possible fault with piece-wise linear terms. Absent a fault, the bug was harmless.

## 20111109
- Update to Gurobi 4.6. 
- New keywords for $gurobi_options are presparsity, priorities, sifting, siftmethod, and zeroobjnodes. Invoke "gurobi -=" for details.

## 20111107
- Permit use of single-user licenses.

## 20111011
- Relink the MS Windows gurobi.exe files so on systems that can use multiple threads, the solve times reported with, e.g., timing=1 will be summed over the threads used, as they are on other systems.

## 20111003
- When processing ampl.lic, ignore new keywords for ampl.netlic. Some platforms remain at 20110928, as their binaries already ignore the new keywords.

## 20110928
- Relink to fix a bug with piece-wise linear terms (introduced 20110920).

## 20110920
- Add "method" as a synonym for "lpmethod", and linke with Gurobi 4.5.1 libraries, which have some (obscure) bug fixes. Invoking "gurobi -v" will show driver version ## 20110907.

## 20110826
- Fix trouble handling piecewise-linar terms ( <<...;...>> v) accidentally introduced 20110814 (in update to "20110728").

## 20110728
- Fix a glitch with sos=1 in $gurobi_options that prevented .sosno and .ref from being used in problems with only continuous variables.

## 20110527
- Relink to permit a quoted "hostname" for MGR_IP in the ampl.lic file for a floating license.

## 20110427
- Correct compilation of mswin64 gurobi.exe; yesterday's version omitted new functionality for Gurobi 4.5.

## 20110426
- Update to Gurobi 4.5.
-  Tweak license checker to correct a rare problem on MS Windows systems.

## 20110322
- Fix a bug in handling problems with integer variables (including binary variables) and piecewise-linear terms: the wrong variables were likely treated as integer.
- Fix a bug with "writeprob" that could occur in problems with piecewise-linear terms: a call on GRBupdatemodel() was missing, which could affect, e.g., a *.lp file specified by writeprob.

## 20110117
- Mention "gurobi" in the "No license for this machine" message.

## 20101207
- Set solve_result_num = 567 if the problem has complementarity constraints.

## 20101115
- Fix a bug (introduced in adjustments for Gurobi 4) that sometimes caused the constant term in objectives to be treated as 0. This affected the objective value reported.

## 20101105
- Update to Gurobi 4.0.