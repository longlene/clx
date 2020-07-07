# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit user vcs-snapshot

MY_PN="spark"
MY_P=${MY_PN}-${PV}

DESCRIPTION="Software framework for fast cluster computing"
HOMEPAGE="http://spark.apache.org/"
SRC_URI="mirror://apache/${MY_PN}/${MY_P}/${MY_P}-bin-without-hadoop.tgz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

RDEPEND="
	virtual/jre
	sys-cluster/hadoop-bin
"

S="${WORKDIR}"/${MY_P}-bin-without-hadoop

INSTALL_DIR=/opt/${MY_P}

pkg_setup(){
	enewgroup hadoop
	enewuser spark -1 /bin/bash /var/lib/hadoop/spark hadoop
}

src_prepare() {
	eapply_user
	find . -name '*.cmd' -exec rm {} \;
	for binary in beeline pyspark sparkR spark-class spark-shell find-spark-home spark-sql spark-submit load-spark-env.sh; do
		sed -i 's|^export SPARK_HOME=.*$|export SPARK_HOME=/opt/spark|' bin/$binary
		sed -i -Ee 's/\$\(dirname "\$0"\)/$(dirname "$(readlink -f "$0")")/g' bin/$binary
	done
}

src_install() {
	sandbox=`egrep -c "^[0-9].*#.* sandbox" /etc/hosts`
	workmem=1024m
	[ $sandbox -ne 0 ] && workmem=192m

	insinto /etc/spark
	doins conf/*
	mv conf conf-templates

	# create file spark-env.sh
	cat > "${D}"/etc/spark/spark-env.sh <<-EOF
SPARK_LOG_DIR=/var/log/spark
SPARK_PID_DIR=/var/run/pids
SPARK_LOCAL_DIRS=/var/lib/spark
SPARK_WORKER_MEMORY=${workmem}
SPARK_WORKER_DIR=/var/lib/spark
SPARK_DIST_CLASSPATH=\$(hadoop classpath)
EOF

	dodir "${INSTALL_DIR}"
	diropts -m770 -o spark -g hadoop
	dodir /var/log/spark
	dodir /var/lib/spark
	mv "${S}"/* "${D}${INSTALL_DIR}"
	fowners -Rf root:hadoop "${INSTALL_DIR}"
	for binary in beeline pyspark sparkR spark-class spark-shell find-spark-home spark-sql spark-submit load-spark-env.sh ; do
		dosym "${INSTALL_DIR}/bin/$binary" /usr/bin/$binary
	done

	# conf symlink
	dosym /etc/spark ${INSTALL_DIR}/conf

	cat > 99spark <<EOF
SPARK_HOME="${INSTALL_DIR}"
SPARK_CONF_DIR="/etc/spark"
EOF
	doenvd 99spark

	# init scripts
	newinitd "${FILESDIR}"/"${MY_PN}.init" "${MY_PN}.init"
	dosym  /etc/init.d/"${MY_PN}.init" /etc/init.d/"${MY_PN}-master"
	dosym  /etc/init.d/"${MY_PN}.init" /etc/init.d/"${MY_PN}-slave"
	if [ `egrep -c "^[0-9].*${HOSTNAME}.*#.* sparkmaster" /etc/hosts` -eq 1 ] ; then
		dosym  /etc/init.d/"${MY_PN}.init" /etc/init.d/"${MY_PN}-master"
	fi
	dosym "${INSTALL_DIR}" "/opt/${MY_PN}"
}
