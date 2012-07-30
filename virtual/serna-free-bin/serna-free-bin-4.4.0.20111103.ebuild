#!/bin/sh
# The #!/bin/sh line above makes that the contex sensitive editor makes colors
# and not that I want to execute it

# Ebuild developed by urs@linurs.org using http://www.linurs.org/ebuildtool.htm
# Use this ebuild on your own risk license
# This ebuild installs the binary version of serna free on Gentoo
inherit eutils

DESCRIPTION="Serna free is a WYSIWYG XML editor"
SRC_URI="http://downloads.syntext.com/serna-free/4.4.0-RELEASE/serna-free-4.4.0-20111103-linux.tgz"
HOMEPAGE="http://www.syntext.com"

SLOT="0"
LICENSE=""
KEYWORDS="~x86"
IUSE=""

src_unpack() {
   unpack ${A} 
}

src_install() {
# The following follows the serna-free installer and has been converted to an ebuild
# It does not require input from the user. 
# Since Gentoo installs first in a temporary
# directory and then merges it into the real root, two sets of variables 
# are required: The original serna variables point to the Gentoo work directory
# Variables as POST_* point to the real root directory.
 
  DEF_INSTALLDIR=${D}opt
  DEF_RUNDIR=${D}opt/bin

  POST_INSTALLDIR=/opt

# The serena-free version numbering is not consistent.
# From the outside it is 4.4.0 but if it comes to the installer it is just 4.4.  
  SERNA_NAME=serna-free
  SERNA_TGZ=${SERNA_NAME}-4.4.tgz
  SERNA_DIR=${SERNA_NAME}-4.4
  SERNA_SCRIPT=${SERNA_NAME}-4.4
  
  INSTALL_PREFIX=$DEF_INSTALLDIR
  POST_INSTALL_PREFIX=$POST_INSTALLDIR

  RUNDIR=${INSTALL_PREFIX}/bin
  POST_RUNDIR=${POST_INSTALL_PREFIX}/bin

  SERNA=${INSTALL_PREFIX}/${SERNA_DIR}

  einfo "Serna will be installed in INSTALL_PREFIX $INSTALL_PREFIX"
  mkdir -p $INSTALL_PREFIX

  einfo "Serna will run in DEF_RUNDIR $DEF_RUNDIR"
  mkdir -p $DEF_RUNDIR

  einfo "Installing Serna to INSTALL_PREFIX/SERNA_DIR: ${INSTALL_PREFIX}/${SERNA_DIR}"
  einfo "Change to INSTALL_PREFIX $INSTALL_PREFIX"
  cd $INSTALL_PREFIX

  PKGDIR=${WORKDIR}/${SERNA_DIR}
  einfo "PKGDIR $PKGDIR"
  einfo "SERNA_TGZ $SERNA_TGZ"
  SERNA_TGZ_PATH=${PKGDIR}/$SERNA_TGZ
  einfo "Unpack file SERNA_TGZ_PATH $SERNA_TGZ_PATH"
  gunzip -c $SERNA_TGZ_PATH | tar -xf -

  SERNA_TAG=${SERNA_NAME}-4.4
  SERNA_EXE=serna.bin

# The serna installer called a post installer to be run outside the sandbox
# This is possible with gentoo ebuilds as well, but not clean since the system
# does not notice how the post installer modifies the system. 
# Orphan files are created that might cause package collision in future updates  
# Therefore the post installer is included in this ebuild and runs in the 
# sandbox
  einfo "Run the post installer in the sandbox."
  RUNDIR=$POST_RUNDIR

  einfo "The following is exported to the post-installer"
  einfo "SERNA_TAG $SERNA_TAG"
  einfo "INSTALL_PREFIX $INSTALL_PREFIX"
  einfo "SERNA_EXE $SERNA_EXE"

  export SERNA_TAG INSTALL_PREFIX SERNA_EXE

  POSTIN=${INSTALL_PREFIX}/${SERNA_DIR}/bin/serna-postin.sh
  einfo "POSTIN $POSTIN"

# Instead of calling the post installer with [ -x ${POSTIN} ] && ${POSTIN}, 
# the post installer code follows here

  for v in SERNA_TAG SERNA_EXE INSTALL_PREFIX; do
    eval test -z \$$v && echo "Variable $v is not set!" && exit 1
  done

  SERNA_SCRIPT=${INSTALL_PREFIX}/${SERNA_TAG}/bin/serna.sh
  einfo "SERNA_SCRIPT $SERNA_SCRIPT"
  
# The following comes is the script the post installer made.
# It is executed when you later run serna
# The script is produced within the sandbox. 
# All lines until EOF are put into the script
  cat << EOF > ${SERNA_SCRIPT}
#!/bin/sh 

inst_prefix=/opt

SERNA_DATA_DIR=\${inst_prefix}/${SERNA_TAG}

LD_LIBRARY_PATH=\${inst_prefix}/${SERNA_TAG}/bin:\${inst_prefix}/${SERNA_TAG}/lib:\${inst_prefix}/${SERNA_TAG}/python/lib:\${LD_LIBRARY_PATH}

if [ x\${AXF4_HOME} = x ]; then
   AXF4_HOME=/usr/XSLFormatterV4
fi

if [ -e \${AXF4_HOME}/lib/libXfoInterface.so ]; then
   LD_LIBRARY_PATH=\${LD_LIBRARY_PATH}:\${AXF4_HOME}/lib
fi

AXF4_LIB_FOLDER=\${AXF4_HOME}/lib
AXF4_BIN_FOLDER=\${AXF4_HOME}/bin
AXF4_ETC_FOLDER=\${AXF4_HOME}/etc
AXF4_SDATA_FOLDER=\${AXF4_HOME}/sdata

if [ x\${AXF4_FONT_CONFIGFILE} = x ]; then
   [ -f \${AXF4_ETC_FOLDER}/font-config.xml ] && AXF4_FONT_CONFIGFILE=\${AXF4_ETC_FOLDER}/font-config.xml
   export AXF4_FONT_CONFIGFILE
fi

AXF4_LIC_PATH=\${AXF4_ETC_FOLDER}
AXF4_HYPDIC_PATH=\${AXF4_ETC_FOLDER}/hyphenation
AXF4_DMC_TBLPATH=\${AXF4_SDATA_FOLDER}/base2

export AXF4_LIC_PATH AXF4_HYPDIC_PATH AXF4_DMC_TBLPATH

JAVA_HOME=\${SERNA_DATA_DIR}/jre
export JAVA_HOME

export SERNA_DATA_DIR
export LD_LIBRARY_PATH

exec \${inst_prefix}/${SERNA_TAG}/bin/${SERNA_EXE} "\$@"
EOF
# After the above EOF the script is finished and can be called later

  SERNA_DIR=${INSTALL_PREFIX}/${SERNA_TAG}
  einfo "SERNA_DIR $SERNA_DIR"
  
  chmod 755 ${SERNA_SCRIPT}
  chmod 755 ${SERNA_DIR}/utils/publishing/*.sh

  RUNDIR=${INSTALL_PREFIX}/bin
  einfo "RUNDIR $RUNDIR" 

  if [ -e ${RUNDIR}/serna ]; then
    rm -f ${RUNDIR}/${SERNA_TAG}.backup
    mv ${RUNDIR}/serna ${RUNDIR}/${SERNA_TAG}.backup
  fi
  ln -sf ../${SERNA_TAG}/bin/serna.sh ${RUNDIR}/${SERNA_TAG}
  ln -sf ${SERNA_TAG} ${RUNDIR}/serna

# End of the code from the post installer 
  
  chmod 755 ${SERNA_DIR}/bin/${SERNA_EXE}  
  chmod 755 ${SERNA_SCRIPT}   
  chmod -R a+r $SERNA
  chmod a+x `find $SERNA -type d`

  einfo "Installation is finished."

  trap 0
}

