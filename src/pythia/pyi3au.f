cc ------------ dpmjet3.4 - authors: S.Roesler, R.Engel, J.Ranft -------
cc -------- phojet1.12-40 - authors: S.Roesler, R.Engel, J.Ranft -------
cc                                                      - oct'13 -------
cc ----------- pythia-6.4 - authors: Torbjorn Sjostrand, Lund'10 -------
cc ---------------------------------------------------------------------
cc                                  converted for use with FLUKA -------
cc                                                      - oct'13 -------
 
C...PYI3AU
C...Calculates real and imaginary parts of the auxiliary function I3;
C...see R. K. Ellis, I. Hinchliffe, M. Soldate and J. J. van der Bij,
C...Nucl. Phys. B297 (1988) 221.
 
      SUBROUTINE PYI3AU(EPS,RAT,Y3RE,Y3IM)
 
C...Double precision and integer declarations.
      IMPLICIT DOUBLE PRECISION(A-H, O-Z)
      IMPLICIT INTEGER(I-N)

C...Commonblocks.
      include 'inc/pydat1'
 
      BE=0.5D0*(1D0+SQRT(1D0+RAT*EPS))
      IF(EPS.LT.1D0) GA=0.5D0*(1D0+SQRT(1D0-EPS))
 
      IF(EPS.LT.0D0) THEN
        IF(ABS(EPS).LT.1D-4.AND.ABS(RAT*EPS).LT.1D-4) THEN
          F3RE=PYSPEN(-0.25D0*EPS/(1D0+0.25D0*(RAT-1D0)*EPS),0D0,1)-
     &    PYSPEN((1D0-0.25D0*EPS)/(1D0+0.25D0*(RAT-1D0)*EPS),0D0,1)+
     &    PYSPEN(0.25D0*(RAT+1D0)*EPS/(1D0+0.25D0*RAT*EPS),0D0,1)-
     &    PYSPEN((RAT+1D0)/RAT,0D0,1)+0.5D0*(LOG(1D0+0.25D0*RAT*EPS)**2-
     &    LOG(0.25D0*RAT*EPS)**2)+LOG(1D0-0.25D0*EPS)*
     &    LOG((1D0+0.25D0*(RAT-1D0)*EPS)/(1D0+0.25D0*RAT*EPS))+
     &    LOG(-0.25D0*EPS)*LOG(0.25D0*RAT*EPS/(1D0+0.25D0*(RAT-1D0)*
     &    EPS))
        ELSEIF(ABS(EPS).LT.1D-4.AND.ABS(RAT*EPS).GE.1D-4) THEN
          F3RE=PYSPEN(-0.25D0*EPS/(BE-0.25D0*EPS),0D0,1)-
     &    PYSPEN((1D0-0.25D0*EPS)/(BE-0.25D0*EPS),0D0,1)+
     &    PYSPEN((BE-1D0+0.25D0*EPS)/BE,0D0,1)-
     &    PYSPEN((BE-1D0+0.25D0*EPS)/(BE-1D0),0D0,1)+
     &    0.5D0*(LOG(BE)**2-LOG(BE-1D0)**2)+
     &    LOG(1D0-0.25D0*EPS)*LOG((BE-0.25D0*EPS)/BE)+
     &    LOG(-0.25D0*EPS)*LOG((BE-1D0)/(BE-0.25D0*EPS))
        ELSEIF(ABS(EPS).GE.1D-4.AND.ABS(RAT*EPS).LT.1D-4) THEN
          F3RE=PYSPEN((GA-1D0)/(GA+0.25D0*RAT*EPS),0D0,1)-
     &    PYSPEN(GA/(GA+0.25D0*RAT*EPS),0D0,1)+
     &    PYSPEN((1D0+0.25D0*RAT*EPS-GA)/(1D0+0.25D0*RAT*EPS),0D0,1)-
     &    PYSPEN((1D0+0.25D0*RAT*EPS-GA)/(0.25D0*RAT*EPS),0D0,1)+
     &    0.5D0*(LOG(1D0+0.25D0*RAT*EPS)**2-LOG(0.25D0*RAT*EPS)**2)+
     &    LOG(GA)*LOG((GA+0.25D0*RAT*EPS)/(1D0+0.25D0*RAT*EPS))+
     &    LOG(GA-1D0)*LOG(0.25D0*RAT*EPS/(GA+0.25D0*RAT*EPS))
        ELSE
          F3RE=PYSPEN((GA-1D0)/(GA+BE-1D0),0D0,1)-
     &    PYSPEN(GA/(GA+BE-1D0),0D0,1)+PYSPEN((BE-GA)/BE,0D0,1)-
     &    PYSPEN((BE-GA)/(BE-1D0),0D0,1)+0.5D0*(LOG(BE)**2-
     &    LOG(BE-1D0)**2)+LOG(GA)*LOG((GA+BE-1D0)/BE)+
     &    LOG(GA-1D0)*LOG((BE-1D0)/(GA+BE-1D0))
        ENDIF
        F3IM=0D0
      ELSEIF(EPS.LT.1D0) THEN
        IF(ABS(EPS).LT.1D-4.AND.ABS(RAT*EPS).LT.1D-4) THEN
          F3RE=PYSPEN(-0.25D0*EPS/(1D0+0.25D0*(RAT-1D0)*EPS),0D0,1)-
     &    PYSPEN((1D0-0.25D0*EPS)/(1D0+0.25D0*(RAT-1D0)*EPS),0D0,1)+
     &    PYSPEN((1D0-0.25D0*EPS)/(-0.25D0*(RAT+1D0)*EPS),0D0,1)-
     &    PYSPEN(1D0/(RAT+1D0),0D0,1)+LOG((1D0-0.25D0*EPS)/
     &    (0.25D0*EPS))*LOG((1D0+0.25D0*(RAT-1D0)*EPS)/
     &    (0.25D0*(RAT+1D0)*EPS))
          F3IM=-PARU(1)*LOG((1D0+0.25D0*(RAT-1D0)*EPS)/
     &    (0.25D0*(RAT+1D0)*EPS))
        ELSEIF(ABS(EPS).LT.1D-4.AND.ABS(RAT*EPS).GE.1D-4) THEN
          F3RE=PYSPEN(-0.25D0*EPS/(BE-0.25D0*EPS),0D0,1)-
     &    PYSPEN((1D0-0.25D0*EPS)/(BE-0.25D0*EPS),0D0,1)+
     &    PYSPEN((1D0-0.25D0*EPS)/(1D0-0.25D0*EPS-BE),0D0,1)-
     &    PYSPEN(-0.25D0*EPS/(1D0-0.25D0*EPS-BE),0D0,1)+
     &    LOG((1D0-0.25D0*EPS)/(0.25D0*EPS))*
     &    LOG((BE-0.25D0*EPS)/(BE-1D0+0.25D0*EPS))
          F3IM=-PARU(1)*LOG((BE-0.25D0*EPS)/(BE-1D0+0.25D0*EPS))
        ELSEIF(ABS(EPS).GE.1D-4.AND.ABS(RAT*EPS).LT.1D-4) THEN
          F3RE=PYSPEN((GA-1D0)/(GA+0.25D0*RAT*EPS),0D0,1)-
     &    PYSPEN(GA/(GA+0.25D0*RAT*EPS),0D0,1)+
     &    PYSPEN(GA/(GA-1D0-0.25D0*RAT*EPS),0D0,1)-
     &    PYSPEN((GA-1D0)/(GA-1D0-0.25D0*RAT*EPS),0D0,1)+
     &    LOG(GA/(1D0-GA))*LOG((GA+0.25D0*RAT*EPS)/
     &    (1D0+0.25D0*RAT*EPS-GA))
          F3IM=-PARU(1)*LOG((GA+0.25D0*RAT*EPS)/
     &    (1D0+0.25D0*RAT*EPS-GA))
        ELSE
          F3RE=PYSPEN((GA-1D0)/(GA+BE-1D0),0D0,1)-
     &    PYSPEN(GA/(GA+BE-1D0),0D0,1)+PYSPEN(GA/(GA-BE),0D0,1)-
     &    PYSPEN((GA-1D0)/(GA-BE),0D0,1)+LOG(GA/(1D0-GA))*
     &    LOG((GA+BE-1D0)/(BE-GA))
          F3IM=-PARU(1)*LOG((GA+BE-1D0)/(BE-GA))
        ENDIF
      ELSE
        RSQ=EPS/(EPS-1D0+(2D0*BE-1D0)**2)
        RCTHE=RSQ*(1D0-2D0*BE/EPS)
        RSTHE=SQRT(MAX(0D0,RSQ-RCTHE**2))
        RCPHI=RSQ*(1D0+2D0*(BE-1D0)/EPS)
        RSPHI=SQRT(MAX(0D0,RSQ-RCPHI**2))
        R=SQRT(RSQ)
        THE=ACOS(MAX(-0.999999D0,MIN(0.999999D0,RCTHE/R)))
        PHI=ACOS(MAX(-0.999999D0,MIN(0.999999D0,RCPHI/R)))
        F3RE=PYSPEN(RCTHE,RSTHE,1)+PYSPEN(RCTHE,-RSTHE,1)-
     &  PYSPEN(RCPHI,RSPHI,1)-PYSPEN(RCPHI,-RSPHI,1)+
     &  (PHI-THE)*(PHI+THE-PARU(1))
        F3IM=PYSPEN(RCTHE,RSTHE,2)+PYSPEN(RCTHE,-RSTHE,2)-
     &  PYSPEN(RCPHI,RSPHI,2)-PYSPEN(RCPHI,-RSPHI,2)
      ENDIF
 
      Y3RE=2D0/(2D0*BE-1D0)*F3RE
      Y3IM=2D0/(2D0*BE-1D0)*F3IM
 
      RETURN
      END
