# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Apache Traffic Server"
HOMEPAGE="https://trafficserver.apache.org/"
SRC_URI="https://github.com/apache/trafficserver/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="curl hwloc unwind"

DEPEND="
	acct-group/trafficserver
	acct-user/trafficserver
	dev-libs/libpcre
	curl? ( net-misc/curl )
	hwloc? ( sys-apps/hwloc )
	unwind? ( sys-libs/libunwind )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		--sysconfdir="${EPREFIX}"/etc/trafficserver \
		--with-user=${PN} \
		--with-group=${PN} \
		$(use_enable curl) \
		$(use_enable unwind) \
		$(use_enable hwloc)
}
