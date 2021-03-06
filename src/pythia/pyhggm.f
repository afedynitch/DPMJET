cc ------------ dpmjet3.4 - authors: S.Roesler, R.Engel, J.Ranft -------
cc -------- phojet1.12-40 - authors: S.Roesler, R.Engel, J.Ranft -------
cc                                                      - oct'13 -------
cc ----------- pythia-6.4 - authors: Torbjorn Sjostrand, Lund'10 -------
cc ---------------------------------------------------------------------
cc                                  converted for use with FLUKA -------
cc                                                      - oct'13 -------
 
C...PYHGGM
C...Determines the Higgs boson mass spectrum using several inputs.
 
      SUBROUTINE PYHGGM(ALPHA)
 
C...Double precision and integer declarations.
      IMPLICIT DOUBLE PRECISION(A-H, O-Z)
      IMPLICIT INTEGER(I-N)
      INTEGER PYCOMP
C...Parameter statement to help give large particle numbers.
      PARAMETER (KSUSY1=1000000,KSUSY2=2000000,KTECHN=3000000,
     &KEXCIT=4000000,KDIMEN=5000000)
C...Commonblocks.
      include 'inc/pydat1'
      include 'inc/pydat2'
      include 'inc/pypars'
      include 'inc/pymssm'
 
C...Local variables.
      DOUBLE PRECISION AT,AB,XMU,TANB
      DOUBLE PRECISION ALPHA
      INTEGER IHOPT
      DOUBLE PRECISION DMA,DTANB,DMQ,DMUR,DMTOP,DAU,DAD
      DOUBLE PRECISION DMU,DMH,DHM,DMHCH,DSA,DCA,DTANBA
      DOUBLE PRECISION DMC,DMDR,DMHP,DHMP,DAMP
      DOUBLE PRECISION DSTOP1,DSTOP2,DSBOT1,DSBOT2
 
      IHOPT=IMSS(4)
      IF(IHOPT.EQ.2) THEN
        ALPHA=RMSS(18)
        RETURN
      ENDIF
      AT=RMSS(16)
      AB=RMSS(15)
      DMGL=RMSS(3)
      XMU=RMSS(4)
      TANB=RMSS(5)
 
      DMA=RMSS(19)
      DTANB=TANB
      DMQ=RMSS(10)
      DMUR=RMSS(12)
      DMDR=RMSS(11)
      DMTOP=PMAS(6,1)
      DMC=PMAS(PYCOMP(KSUSY1+37),1)
      DAU=AT
      DAD=AB
      DMU=XMU
      RMSS(40)=0D0
      RMSS(41)=0D0
 
      IF(IHOPT.EQ.0) THEN
        CALL PYSUBH (DMA,DTANB,DMQ,DMUR,DMTOP,DAU,DAD,DMU,DMH,DHM,
     &  DMHCH,DSA,DCA,DTANBA)
      ELSEIF(IHOPT.EQ.1) THEN
        CALL PYSUBH (DMA,DTANB,DMQ,DMUR,DMTOP,DAU,DAD,DMU,DMH,DHM,
     &  DMHCH,DSA,DCA,DTANBA)
        CALL PYPOLE(3,DMC,DMA,DTANB,DMQ,DMUR,DMDR,DMTOP,DAU,DAD,DMU,
     &  DMH,DMHP,DHM,DHMP,DAMP,DSA,DCA,
     &  DSTOP1,DSTOP2,DSBOT1,DSBOT2,DTANBA,DMGL,DDT,DDB)
        RMSS(40)=DDT
        RMSS(41)=DDB
        DMH=DMHP
        DHM=DHMP
        DMA=DAMP
        IF(ABS(PMAS(PYCOMP(1000006),1)-DSTOP2).GT.5D-1) THEN
         WRITE(MSTU(11),*) ' STOP1 MASS DOES NOT MATCH IN PYHGGM '
         WRITE(MSTU(11),*) ' STOP1 MASSES = ',
     & PMAS(PYCOMP(1000006),1),DSTOP2
        ENDIF
        IF(ABS(PMAS(PYCOMP(2000006),1)-DSTOP1).GT.5D-1) THEN
         WRITE(MSTU(11),*) ' STOP2 MASS DOES NOT MATCH IN PYHGGM '
         WRITE(MSTU(11),*) ' STOP2 MASSES = ',
     & PMAS(PYCOMP(2000006),1),DSTOP1
        ENDIF
        IF(ABS(PMAS(PYCOMP(1000005),1)-DSBOT2).GT.5D-1) THEN
         WRITE(MSTU(11),*) ' SBOT1 MASS DOES NOT MATCH IN PYHGGM '
         WRITE(MSTU(11),*) ' SBOT1 MASSES = ',
     & PMAS(PYCOMP(1000005),1),DSBOT2
        ENDIF
        IF(ABS(PMAS(PYCOMP(2000005),1)-DSBOT1).GT.5D-1) THEN
         WRITE(MSTU(11),*) ' SBOT2 MASS DOES NOT MATCH IN PYHGGM '
         WRITE(MSTU(11),*) ' SBOT2 MASSES = ',
     & PMAS(PYCOMP(2000005),1),DSBOT1
        ENDIF
 
      ELSEIF (IHOPT.EQ.3) THEN
c...Use FeynHiggs to fix Higgs sector (cf feynhiggs.de)
C...Currently only available for SLHA spectrum read-in.
        IF (IMSS(1).NE.11.AND.IMSS(1).NE.12.AND.IMSS(1).NE.13) THEN
          CALL PYERRM(11,'(PYHGGM:) FeynHiggs needs SLHA or ISASUSY'
     &         //' spectrum, change IMSS(1) or IMSS(4) option.')
        ENDIF
        ALPHA=RMSS(18)
        RETURN
      ENDIF
 
      ALPHA=ACOS(DCA)
 
      PMAS(25,1)=DMH
      PMAS(35,1)=DHM
      PMAS(36,1)=DMA
      PMAS(37,1)=DMHCH
 
      RETURN
      END
