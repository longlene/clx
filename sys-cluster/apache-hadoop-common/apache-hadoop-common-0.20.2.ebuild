# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils java-utils-2

DESCRIPTION="Software framework for data intensive distributed applications"
HOMEPAGE="http://hadoop.apache.org/"
SRC_URI="mirror://apache/hadoop/core/hadoop-${PV}/hadoop-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror binchecks"
IUSE=""

DEPEND=""
RDEPEND=">=virtual/jre-1.6
	net-misc/openssh
	net-misc/rsync"

S=${WORKDIR}/hadoop-${PV}
INSTALL_DIR=/opt/hadoop
export CONFIG_PROTECT="${CONFIG_PROTECT} ${INSTALL_DIR}/conf"

pkg_setup(){
	enewgroup hadoop
	enewuser hadoop -1 /bin/sh /var/lib/hadoop hadoop
}

src_install() {
	# The hadoop-env.sh file needs JAVA_HOME set explicitly
	sed -i -e "2iexport JAVA_HOME=${JAVA_HOME}" conf/hadoop-env.sh || die "sed failed"

	dodir "${INSTALL_DIR}"
	mv "${S}"/* "${D}${INSTALL_DIR}" || die "install failed"
	chown -Rf hadoop:hadoop "${D}${INSTALL_DIR}"

	# env file
	cat > 99hadoop <<-EOF
		HADOOP_HOME=${INSTALL_DIR}
		PATH=${INSTALL_DIR}/bin
		CONFIG_PROTECT=${INSTALL_DIR}/conf
	EOF
	doenvd 99hadoop || die "doenvd failed"
}

pkg_postinst() {
	elog "For info on configuration see http://hadoop.apache.org/core/docs/r${PV}"
}
