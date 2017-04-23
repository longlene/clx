# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils java-utils-2 user

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
	sys-cluster/zookeeper-bin
"

S="${WORKDIR}"/${MY_P}
INSTALL_DIR=/opt/${MY_P}
DATA_DIR=/var/lib/hbase
export CONFIG_PROTECT="${CONFIG_PROTECT} ${INSTALL_DIR}/conf"

pkg_setup() {
	enewuser hbase -1 /bin/bash /var/lib/hbase hadoop
}

src_prepare() {
	eapply_user
	use doc || rm -rf docs
	find "${S}" -name '*.cmd' -exec rm {} \;
}

src_install() {
	cat >tmpfile<<EOF
# Add by Portage
export JAVA_HOME=$(java-config -g JAVA_HOME)
export HBASE_CONF_DIR=/etc/hbase
export HBASE_PID_DIR=/var/run/hbase
export HBASE_LOG_DIR=/var/log/hbase
#export HBASE_MANAGES_ZK=false
EOF
	sed -i '/# Set environment variables/r tmpfile' conf/hbase-env.sh || die
	cat >tmpfile<<EOF
  <property>
    <name>hbase.rootdir</name>
    <value>file:///var/lib/hbase</value>
  </property>
  <property>
    <name>hbase.zookeeper.property.dataDir</name>
    <value>/var/lib/hbase/zookeeper</value>
  </property>
EOF
	sed -i '/<configuration>/r tmpfile' conf/hbase-site.xml || die

	sed -i '/\$0/cbin="$0"\nwhile [ -L "$bin" ]; do\n\tbin=`readlink -e "$bin"`\ndone\nbin=`dirname "$bin"`' bin/hbase || die

	dodir "${INSTALL_DIR}"
	mv "${S}"/* "${D}${INSTALL_DIR}" || die "install failed"

	dosym ${INSTALL_DIR}/bin/hbase /usr/bin/hbase

	## env file
	#cat > 99"${PN}" <<-EOF
	#	PATH=${INSTALL_DIR}/bin
	#	CONFIG_PROTECT=${INSTALL_DIR}/conf
	#EOF
	#doenvd 99"${PN}"

	 keepdir /var/log/hbase
	 fowners -R hbase:hadoop /var/log/hbase


	cp "${FILESDIR}"/${MY_PN}.initd .
	sed -e "/HBASE_HOME/{s#hbase-VERSION#hbase-${PV}#}" -i ${MY_PN}.initd
	newinitd ${MY_PN}.initd hbase

	dosym ${INSTALL_DIR}/conf /etc/hbase
}

