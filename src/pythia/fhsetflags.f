cc ------------ dpmjet3.4 - authors: S.Roesler, R.Engel, J.Ranft -------
cc -------- phojet1.12-40 - authors: S.Roesler, R.Engel, J.Ranft -------
cc                                                      - oct'13 -------
cc ----------- pythia-6.4 - authors: Torbjorn Sjostrand, Lund'10 -------
cc ---------------------------------------------------------------------
cc                                  converted for use with FLUKA -------
cc                                                      - oct'13 -------
 
C...FHSETFLAGS
C...Dummy function, to be removed when FEYNHIGGS is to be linked.
 
      SUBROUTINE FHSETFLAGS(IERR,IMSP,IFR,ITBR,IHMX,IP2A,ILP,ITR,IBR)
      IMPLICIT DOUBLE PRECISION(A-H, O-Z)
      IMPLICIT INTEGER(I-N)
Cmssmpart = 4     # full MSSM [recommended]
Cfieldren = 0     # MSbar field ren. [strongly recommended]
Ctanbren =  0     # MSbar TB-ren. [strongly recommended]
Chiggsmix = 2     # 2x2 (h0-HH) mixing in the neutral Higgs sector
Cp2approx = 0     # no approximation [recommended]
Clooplevel= 2     # include 2-loop corrections
Ctl_running_mt= 1 # running top mass in 2-loop corrections [recommended]
Ctl_bot_resum = 1 # resummed MB in 2-loop corrections [recommended]
 
C...Commonblocks.
      include 'inc/pydat1'
 
C...Stop program if this routine is ever called.
      WRITE(MSTU(11),5000)
      CALL PYSTOP(103)
 
C...Format for error printout.
 5000 FORMAT(1X,'Error: you did not link FEYNHIGGS correctly.'/
     &1X,'Dummy routine FHSETFLAGS in PYTHIA file called instead.'/
     &1X,'Execution stopped!')
      RETURN
      END
