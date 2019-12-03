# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="High-performance MySQL proxy"
HOMEPAGE="http://www.proxysql.com"
SRC_URI="https://github.com/sysown/proxysql/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-misc/curl
	dev-libs/openssl
"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup proxysql
	enewuser proxysql -1 /bin/bash /var/lib/proxysql
}

src_prepare() {
	eapply_user
	sed -i 's#-L$(CURL_LDIR)##' src/Makefile
	sed -i '/default:/{s#\ curl##}' deps/Makefile
}

src_install() {
	dobin src/proxysql
	insinto /etc
	doins etc/proxysql.cnf


