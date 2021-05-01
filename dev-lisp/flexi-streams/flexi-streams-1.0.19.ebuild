# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="FLEXI-STREAMS implements \"virtual\" bivalent streams that can be layered atop real binary or bivalent streams."
HOMEPAGE="http://weitz.de/flexi-streams/
		http://www.cliki.net/flexi-streams/"
SRC_URI="https://github.com/edicl/flexi-streams/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="test"

RDEPEND="
	>=dev-lisp/trivial-gray-streams-20060925"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem :flexi-streams-test/,$d' ${PN}.asd
		rm -r test
	fi
}
