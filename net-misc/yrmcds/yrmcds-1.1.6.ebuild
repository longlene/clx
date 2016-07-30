# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="memcached compatible KVS with master/slave replication"
HOMEPAGE="http://cybozu.github.io/yrmcds/"
SRC_URI="https://github.com/cybozu/yrmcds/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/DEFAULT_CONFIG =/{s#$(PREFIX)##}' Makefile
}

# TODO need init.d files
src_install() {
	insinto /etc
	newins etc/upstart ${PN}.conf
	insinto /etc/logrotate.d
	newins etc/logrotate ${PN}
	dosbin ${PN}
	dodoc README.md
}

