# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

DESCRIPTION="Yaws webserver"
HOMEPAGE="http://yaws.hyber.org"
SRC_URI="https://github.com/klacke/yaws/archive/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/erlang"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e 's#/sbin/runscript#/sbin/openrc-run#' \
		-i scripts/gentoo/yaws.init
	eautoreconf
}

src_configure() {
	econf --localstatedir=/var
}

src_install() {
	emake DESTDIR="${D}" install
	keepdir /var/log/yaws
}
