
call REPLACEME_SV_CL_LAUNCH_SCRIPT

cd ../REPLACEME_SV_TCL_DIR/win
nmake -f makefile.vc MACHINE=AMD64 INSTALLDIR="REPLACEME_SV_TOP_BIN_DIR_TCL" OPTS=msvcrt,threads hose
nmake -f makefile.vc MACHINE=AMD64 INSTALLDIR="REPLACEME_SV_TOP_BIN_DIR_TCL" OPTS=msvcrt,threads release
nmake -f makefile.vc MACHINE=AMD64 INSTALLDIR="REPLACEME_SV_TOP_BIN_DIR_TCL" OPTS=msvcrt,threads install
chmod -R a+rwx REPLACEME_SV_TOP_BIN_DIR_TCL
cd ../..
cd REPLACEME_SV_TK_DIR/win
nmake -f makefile.vc MACHINE=AMD64 TCLDIR="REPLACEME_SV_TOP_SRC_DIR_TCL" INSTALLDIR="REPLACEME_SV_TOP_BIN_DIR_TK" OPTS=msvcrt,threads hose
nmake -f makefile.vc MACHINE=AMD64 TCLDIR="REPLACEME_SV_TOP_SRC_DIR_TCL" INSTALLDIR="REPLACEME_SV_TOP_BIN_DIR_TK" OPTS=msvcrt,threads release
nmake -f makefile.vc MACHINE=AMD64 TCLDIR="REPLACEME_SV_TOP_SRC_DIR_TCL" INSTALLDIR="REPLACEME_SV_TOP_BIN_DIR_TK" OPTS=msvcrt,threads install
chmod -R a+rwx REPLACEME_SV_TOP_BIN_DIR_TK
