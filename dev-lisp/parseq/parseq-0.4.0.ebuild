# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Parseq is a package for Common Lisp used for parsing sequences such as strings, lists and vectors"
HOMEPAGE="https://github.com/mrossini-ethz/parseq/"
SRC_URI="https://github.com/mrossini-ethz/parseq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -e '/parseq-test/,$d' -i ${PN}.asd
		rm -r test
	fi
}
