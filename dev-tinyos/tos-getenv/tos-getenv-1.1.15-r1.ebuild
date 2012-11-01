# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tinyos/tos-getenv/tos-getenv-1.1.15-r1.ebuild,v 1.4 2010/02/06 11:58:54 ulm Exp $

CVS_MONTH="Dec"
CVS_YEAR="2005"
MY_P="tinyos"

inherit eutils java-pkg-2 toolchain-funcs

DESCRIPTION="TinyOS JNI getenv support library"
HOMEPAGE="http://www.tinyos.net/"
SRC_URI="http://www.tinyos.net/dist-1.1.0/tinyos/source/${MY_P}-${PV}${CVS_MONTH}${CVS_YEAR}cvs.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND=">=dev-java/ibm-jdk-bin-1.4.0
	dev-java/java-config"
RDEPEND=">=dev-java/ibm-jdk-bin-1.4.0"
IUSE=""

S=${WORKDIR}/${MY_P}-${PV}${CVS_MONTH}${CVS_YEAR}cvs/tools/java/jni

pkg_setup() {
	if ! built_with_use dev-java/ibm-jdk-bin javacomm ; then
		eerror "javacomm is required! Add javacomm to your use flag then re-emerge ibm-jdk-bin."
		eerror "Then re-emerge this package."
		die "setup failed due to missing prerequisite: javacomm"
	fi
	java-pkg-2_pkg_setup
	java-pkg_ensure-vm-version-ge 1 4 0
	local vendor="$(java-pkg_get-vm-vendor)"
	einfo "${vendor} vm detected."
	if ! [[ ${vendor} = "ibm" ]]; then
		eerror "ibm-jdk-bin is required!"
		eerror "Please use java-config -S to set your system vm to a ibm-jdk."
		die "setup failed due to missing prerequisite: ibm-jdk-bin"
	fi
}

src_compile() {
	# Quoting the Makefile:
	# The install rules assume that JNI libraries should be placed in .../jre/bin
	# This seems to be true on Windows, and IBM's Linux Java
	# It's not true for Sun's Linux Java (but we don't have javax.comm for that, so...)
	$(tc-getCC) ${CFLAGS} -I$(java-config-2 -O)/include $(java-pkg_get-jni-cflags) \
		-shared -fpic -Wl,-z,now -o libgetenv.so net_tinyos_util_Env.c  \
		|| die "Failed compiling libgetenv.so"
}

src_install() {
	#local JNI=$(java-config-2 -O)/jre/bin
	#the call to java-config-2 could be avoided if JAVA_HOME is set.
	#actually don't work on my system so using java-config-2 is the only way.
	#
	#java-pkg_sointo ${JNI}
	#java-pkg_doso libgetenv.so
	#the above functions causes strange error on my system. Falling back to generic methods.

	local JNI="$(java-config -O)/jre"
	into ${JNI}
	dobin libgetenv.so
}
