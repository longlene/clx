# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit eutils java-utils-2

MY_PN="hbase"
MY_P=${MY_PN}-${PV}

DESCRIPTION="HBase is the Hadoop database"
HOMEPAGE="http://hbase.apache.org/"
SRC_URI="mirror://apache/hbase/${PV}/${MY_P}-bin.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror binchecks"
IUSE="doc"

DEPEND=""
RDEPEND="
	sys-cluster/hadoop-bin
"

INSTALL_DIR=/opt/"${PN}"
DATA_DIR=/var/db/"${PN}"
export CONFIG_PROTECT="${CONFIG_PROTECT} ${INSTALL_DIR}/conf"

src_prepare() {
	eapply_user
	use doc || rm -rf docs
	find "${S}" -name '*.cmd' -exec rm {} \;
}

src_install() {
	# The hadoop-env.sh file needs JAVA_HOME set explicitly
	sed -e "2iexport JAVA_HOME=${JAVA_HOME}" \
		-e "3iexport HBASE_LOG_DIR=/var/log/hadoop" \
		-i conf/hbase-env.sh

	dodir "${INSTALL_DIR}"
	mv "${S}"/* "${D}${INSTALL_DIR}" || die "install failed"

	# env file
	cat > 99"${PN}" <<-EOF
		PATH=${INSTALL_DIR}/bin
		CONFIG_PROTECT=${INSTALL_DIR}/conf
	EOF
	doenvd 99"${PN}"

	cat > "${PN}" <<-EOF
		#!/sbin/runscript

		start() {
			${INSTALL_DIR}/bin/start-hbase.sh > /dev/null
				}

		stop() {
			${INSTALL_DIR}/bin/stop-hbase.sh > /dev/null
				}
	EOF
	doinitd "${PN}"
}

pkg_postinst() {
	elog "For info on configuration see http://hadoop.apache.org/${PN}/docs/r${PV}"
}
