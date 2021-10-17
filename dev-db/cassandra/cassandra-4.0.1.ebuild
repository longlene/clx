# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils java-pkg-2 user versionator

DESCRIPTION="A highly scalable second-generation distributed database"
HOMEPAGE="http://cassandra.apache.org/"
SRC_URI="mirror://apache/cassandra/${PV}/apache-cassandra-${PV}-bin.tar.gz"
S="${WORKDIR}/apache-cassandra-${PV}"

LICENSE="Apache-2.0"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="~x86 ~amd64"
RDEPEND=">=virtual/jre-1.7"

S="${WORKDIR}/apache-cassandra-${PV}"
INSTALL_DIR="/opt/cassandra-${SLOT}"

pkg_setup() {
	enewgroup cassandra || die "Could not create group"
	enewuser cassandra -1 /bin/bash ${INSTALL_DIR} cassandra
}

src_prepare() {
	cd "${S}"
	find . \( -name \*.bat -or -name \*.exe \) -delete
	rm bin/stop-server
	default
}

src_install() {
	insinto ${INSTALL_DIR}

	sed -e "s|/var/lib/cassandra|/var/lib/cassandra/${SLOT}|g" \
		-i conf/cassandra.yaml || die

	sed -e "s|cassandra_storagedir=\"\$CASSANDRA_HOME/data\"|cassandra_storagedir=\"/var/lib/cassandra/${SLOT}\"|g" \
		-i bin/cassandra.in.sh || die

	doins -r bin conf interface lib pylib tools

	for i in bin/* ; do
		if [[ $i == *.in.sh ]]; then
			continue
		fi
		fperms 755 ${INSTALL_DIR}/${i}
		make_wrapper "$(basename ${i})-${SLOT}" "${INSTALL_DIR}/${i}"
	done

	keepdir /var/lib/cassandra/${SLOT}
	fowners -R cassandra:cassandra ${INSTALL_DIR}
	fowners -R cassandra:cassandra /var/lib/cassandra

	sed "s/{SLOT}/${SLOT}/g" "${FILESDIR}/init" > "${T}/init" || die
	newinitd "${T}/init" cassandra

	echo "CONFIG_PROTECT=\"${INSTALL_DIR}/conf\"" > "${T}/25cassandra-${SLOT}" || die
	doenvd "${T}/25cassandra-${SLOT}"

	dosym "/usr/bin/cassandra-${SLOT}" "/usr/bin/cassandra"
	dosym "/usr/bin/cqlsh-${SLOT}" "/usr/bin/cqlsh"
	dosym "/usr/bin/nodetool-${SLOT}" "/usr/bin/nodetool"
}

pkg_postinst() {
	elog "Cassandra's configuration:"
	elog " * Run-time: /etc/cassandra/"
	elog " * Start-up: /etc/conf.d/cassandra"

	elog "Cassandra works best when the commitlog directory and the data directory are on different disks"
	elog "The default configuration sets them to /var/lib/cassandra/commitlog and /var/lib/cassandra/data respectively"
	elog "You may wish to change those to different mount points"

	ewarn "You should start/stop cassandra via /etc/init.d/cassandra, as this will properly switch to the cassandra:cassandra user group"
	ewarn "Starting cassandra via its default 'cassandra' shell command, as root, may cause permission problems later on when started as the cassandra user"
}
