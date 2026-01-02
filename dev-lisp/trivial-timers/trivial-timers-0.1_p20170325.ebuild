# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="83c8505eb89f8a1756b13c0cd5a4e0027975f278"

DESCRIPTION="Portable timers for Common Lisp"
HOMEPAGE="https://github.com/cosmonaut-ok/trivial-timers"
SRC_URI="https://github.com/cosmonaut-ok/trivial-timers/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
