# Ebuild developed by urs@linurs.org using http://www.linurs.org/ebuildtool.htm
# Use this ebuild on your own risk license
# This ebuild installs the binary version of serna free on Gentoo
inherit eutils

DESCRIPTION="Serna free is a XML editor"
SRC_URI="http://downloads.syntext.com/serna/serna-free-4.2.0-20091009-linux.tgz"
HOMEPAGE="http://www.syntext.com"

SLOT="0"
LICENSE=""
KEYWORDS="~x86"
IUSE=""

src_unpack() {
   unpack ${A} 
}

src_install() {
# The following follows the serna-free installer, however it does not 
# require input from the user. Since Gentoo installs first in a temporary
# directory and then merges it into the real root, two sets of variables 
# are required: The original serna variables point to the Gentoo work directory
# Variables as POST_* point to the real root directory.
 
  DEF_INSTALLDIR=${D}opt
  DEF_RUNDIR=${D}opt/bin

  POST_INSTALLDIR=/opt

# The serena-free version numbering is not consistent.
# From the outside it is 4.2.0 but if it comes to the installer it is just 4.2.  
  SERNA_NAME=serna-free
  SERNA_TGZ=${SERNA_NAME}-4.2.tgz
  SERNA_DIR=${SERNA_NAME}-4.2
  SERNA_SCRIPT=${SERNA_NAME}-4.2
  
  INSTALL_PREFIX=$DEF_INSTALLDIR
  POST_INSTALL_PREFIX=$POST_INSTALLDIR

  RUNDIR=${INSTALL_PREFIX}/bin
  POST_RUNDIR=${POST_INSTALL_PREFIX}/bin

  SERNA=${INSTALL_PREFIX}/${SERNA_DIR}

  einfo "Serna will be installed in $INSTALL_PREFIX"
  mkdir -p $INSTALL_PREFIX

  einfo "Serna will run in $DEF_RUNDIR"
  mkdir -p $DEF_RUNDIR

  einfo "Installing Serna to: ${INSTALL_PREFIX}/${SERNA_DIR}"
  einfo "Change to $INSTALL_PREFIX"
  cd $INSTALL_PREFIX

  PKGDIR=${WORKDIR}/${SERNA_DIR}
  einfo "pwd $PKGDIR"
  einfo "tgz $SERNA_TGZ"
  SERNA_TGZ_PATH=${PKGDIR}/$SERNA_TGZ
  einfo "Unpack file $SERNA_TGZ_PATH"
  gunzip -c $SERNA_TGZ_PATH | tar -xf -
}

pkg_postinst()
{
  SERNA_TAG=${SERNA_NAME}-4.2
  SERNA_EXE=serna.bin

  INSTALL_PREFIX=$POST_INSTALL_PREFIX
  RUNDIR=$POST_RUNDIR

  einfo "The following is exported to the post-installer"
  einfo "SERNA_TAG $SERNA_TAG"
  einfo "INSTALL_PREFIX $INSTALL_PREFIX"
  einfo "SERNA_EXE $SERNA_EXE"

  export SERNA_TAG INSTALL_PREFIX SERNA_EXE

  POSTIN=${INSTALL_PREFIX}/${SERNA_DIR}/bin/serna-postin.sh
  einfo "POSTIN $POSTIN"

  [ -x ${POSTIN} ] && ${POSTIN}
  
 
  chmod 755 ${RUNDIR}/${SERNA_SCRIPT} ${INSTALL_PREFIX}/${SERNA_DIR}/bin/${SERNA_EXE}
  chmod -R a+r $SERNA
  chmod a+x `find $SERNA -type d`

  einfo "Installation is finished. Run Serna as: ${RUNDIR}/${SERNA_SCRIPT}"

  trap 0
}

