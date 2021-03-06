cc ------------ dpmjet3.4 - authors: S.Roesler, R.Engel, J.Ranft -------
cc -------- phojet1.12-40 - authors: S.Roesler, R.Engel, J.Ranft -------
cc                                                      - oct'13 -------
cc ----------- pythia-6.4 - authors: Torbjorn Sjostrand, Lund'10 -------
cc ---------------------------------------------------------------------
cc                                  converted for use with FLUKA -------
cc                                                      - oct'13 -------
 
C...PYRVG1
C...Integrand for resonance contributions
 
      DOUBLE PRECISION FUNCTION PYRVG1(X)
 
      IMPLICIT NONE
      include 'inc/pyrvpm'
      DOUBLE PRECISION X, DELTAY,PYRVR
      DOUBLE PRECISION RVR,E2,E3,C1,SR1,SR2,A1,A2
      RVR    = PYRVR(X,RESM(1),RESW(1))
      C1     = 2D0*SQRT(MAX(0D0,X))
      IF (.NOT.MFLAG) THEN
        E2     = X/C1
        E3     = (RM(0)**2-X)/C1
        DELTAY = 4D0*E2*E3
        PYRVG1 = DELTAY*RVR*X*(A(1)**2+B(1)**2)*(RM(0)**2-X)
      ELSE
        E2     = (X-RM(1)**2+RM(2)**2)/C1
        E3     = (RM(0)**2-X-RM(3)**2)/C1
        SR1    = SQRT(MAX(0D0,E2**2-RM(2)**2))
        SR2    = SQRT(MAX(0D0,E3**2-RM(3)**2))
        DELTAY = 4D0*SR1*SR2
        A1     = 4.*A(1)*B(1)*RM(3)*RM(0)
        A2     = (A(1)**2+B(1)**2)*(RM(0)**2+RM(3)**2-X)
        PYRVG1 = DELTAY*RVR*(X-RM(1)**2-RM(2)**2)*(A1+A2)
      ENDIF
      RETURN
      END
