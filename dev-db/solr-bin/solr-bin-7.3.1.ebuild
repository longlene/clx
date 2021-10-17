# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit user java-utils-2

MY_PN="solr"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="The popular, blazing fast open source enterprise search platform from the Apache Lucene project."
HOMEPAGE="http://lucene.apache.org/solr/"
SRC_URI="mirror://apache/lucene/${MY_PN}/${PV}/${MY_PN}-${PV}.tgz"

KEYWORDS="~amd64"
SLOT="0"
LICENSE="Apache-2.0"
IUSE="doc examples"

DEPEND="sys-process/lsof"
RDEPEND=">=virtual/jre-1.8"

INSTALL_DIR=/opt/"${PN}"

S=${WORKDIR}/${MY_P}

pkg_setup() {
	enewgroup solr
	enewuser solr -1 /bin/bash /var/lib/${MY_PN} solr
}

src_prepare() {
	eapply_user
	# remove files that are not needed on linux
	find \( -name "*.bat" -o -name "*.cmd" \) -delete
}

src_install() {
	newinitd "${FILESDIR}/solr.initd" ${PN}
	newconfd "${FILESDIR}/solr.confd" ${PN}

	insinto /etc/${MY_PN}
	doins -r server/{contexts,resources}
	insinto /etc/${MY_PN}/server
	doins -r server/etc/*

	insinto "${INSTALL_DIR}"
	doins -r bin dist contrib

	use example || doins -r example

	dodir /var/log/"${MY_PN}"
	fperms 750 /var/log/${MY_PN}
	fowners solr:solr /var/log/${MY_PN}
}
