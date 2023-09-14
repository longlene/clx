# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9566ce8adfb299faef803d95736c780413a1373c"

DESCRIPTION="Convert floating point values to IEEE 754 binary representation"
HOMEPAGE="http://common-lisp.net/project/ieee-floats/"
SRC_URI="https://github.com/marijnh/ieee-floats/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="test"

RDEPEND="test? ( dev-lisp/fiveam )"

src_prepare() {
	default
	if ! use test ; then
		sed -e '/defsystem :ieee-floats\/tests/,$d' \
			-i ${PN}.asd
		rm tests.lisp
	fi
}
