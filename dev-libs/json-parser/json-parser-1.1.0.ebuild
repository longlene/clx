# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Very low footprint JSON parser written in portable ANSI C"
HOMEPAGE="https://github.com/udp/json-parser"
SRC_URI="mirror://github/udp/json-parser/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	local target="install-shared"
	if use static-libs ; then
		target="install"
	fi
	emake DESTDIR="${D}" $target || die "install failed"
}
