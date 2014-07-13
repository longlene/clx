# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils

DESCRIPTION="Neo4j is a high-performance, NOSQL graph database with all the features of a mature and robust database."
HOMEPAGE="http://neo4j.org/"
SRC_URI="http://dist.neo4j.org/${PN}-${PV}-unix.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

RDEPEND="!dev-db/neo4j-advanced
	!dev-db/neo4j-enterprise
	>=virtual/jre-1.6
	sys-process/lsof"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-neo4j.patch"
	epatch "${FILESDIR}/${P}-utils.patch"
	epatch "${FILESDIR}/${P}-wrapper_configuration.patch"
	epatch "${FILESDIR}/${P}-server_properties.patch"
}

src_install() {
	exeinto /opt/neo4j/bin
	doexe "${S}"/bin/neo4j || die
	doexe "${S}"/bin/neo4j-shell || die
	doexe "${S}"/bin/utils || die

	# system requirements
	insinto /opt/neo4j/system/lib
	doins "${S}"/system/lib/*.jar || die
	
	# components directory
	insinto /opt/neo4j/lib
	doins "${S}"/lib/*.jar || die

	# plugins directory
	dodir /opt/neo4j/plugins || die

	# config files
	insinto /etc/neo4j
	doins "${S}"/conf/neo4j-wrapper.conf || die
	doins "${S}"/conf/neo4j.properties || die
	doins "${S}"/conf/neo4j-server.properties || die
	doins "${S}"/conf/logging.properties || die

	# data directories
	dodir /var/db/neo4j
	dodir /var/db/neo4j/log

	# documentation
	dodoc "${S}"/*.txt
	dodoc -r "${S}"/doc/*

	# init script
	newinitd "${FILESDIR}"/neo4j.init neo4j || die

	# create symlinks
	dosym /opt/neo4j/bin/neo4j /opt/bin/neo4j || die
	dosym /opt/neo4j/bin/neo4j-shell /opt/bin/neo4j-shell || die
}
