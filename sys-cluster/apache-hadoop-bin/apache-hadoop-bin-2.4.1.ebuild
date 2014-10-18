# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils java-utils-2

MY_PN="hadoop"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Software framework for data intensive distributed applications"
HOMEPAGE="http://hadoop.apache.org/"
SRC_URI="mirror://apache/hadoop/common/${MY_P}/${MY_P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror binchecks"
IUSE=""

DEPEND=""
RDEPEND=">=virtual/jre-1.6
	net-misc/openssh
	net-misc/rsync"

S=${WORKDIR}/${MY_P}
INSTALL_DIR=/opt/hadoop

pkg_setup(){
	enewgroup hadoop
	enewuser hdfs -1 /bin/bash /var/lib/hadoop/hdfs hadoop
	enewuser mapred -1 /bin/bash /var/lib/hadoop/mapred hadoop
}

src_install() {
	# remove the useless cmd bat file
	find "${S}" -name '*.cmd' -exec rm {} \;

	# The hadoop-env.sh file needs JAVA_HOME set explicitly
	JAVA_HOME=$(java-config -g JAVA_HOME)
	sed -e "2iexport JAVA_HOME=${JAVA_HOME}" -i etc/hadoop/hadoop-env.sh || die "sed failed"
	cat >> etc/hadoop/hadoop-env.sh <<-EOF

# Added by Gentoo Portage
export HADOOP_CONF_DIR=${INSTALL_DIR}/etc/hadoop
export HADOOP_LOG_DIR=/var/log/hadoop
export HADOOP_SECURE_DN_LOG_DIR=/var/log/hadoop
export HADOOP_PID_DIR=/var/run/hadoop
export HADOOP_SECURE_DN_PID_DIR=/var/run/hadoop
EOF

	# make useful dirs
	diropts -m770 -o root -g hadoop
	dodir /var/log/"${MY_PN}"
	dodir /var/lib/"${MY_PN}"

	diropts -m770 -o hdfs -g hadoop
	dodir /var/lib/"${MY_PN}"/hdfs

	diropts -m770 -o mapred -g hadoop
	dodir /var/lib/"${MY_PN}"/mapred

	# install dir
	dodir "${INSTALL_DIR}"
	mv "${S}"/* "${D}${INSTALL_DIR}" || die "install failed"
	chown -Rf root:hadoop "${D}${INSTALL_DIR}"

	# env file
	cat > 99hadoop <<-EOF
		HADOOP_HOME="${INSTALL_DIR}"
		PATH="${INSTALL_DIR}/bin"
		CONFIG_PROTECT="${INSTALL_DIR}/etc/hadoop"
	EOF
	doenvd 99hadoop || die "doenvd failed"

	# conf symlink
	dodir /etc/hadoop
	dosym ${INSTALL_DIR}/etc/hadoop /etc/hadoop/conf

	# init scripts
	newinitd "${FILESDIR}"/"${MY_PN}".initd "${MY_PN}"
	for i in "namenode" "datanode" "historyserver" "jobtracker" "secondarynamenode" "tasktracker"
	do
		dosym /etc/init.d/"${MY_PN}" /etc/init.d/"${MY_PN}"-"${i}"
	done
}

pkg_postinst() {
	elog "For info on configuration see http://hadoop.apache.org/core/docs/r${PV}"
}
