# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3

DESCRIPTION="Unix-style command line options parser"
HOMEPAGE="https://github.com/mrkkrp/unix-opts/"
SRC_URI="https://github.com/mrkkrp/unix-opts/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	use test || rm -r ${PN}-tests.asd tests.lisp
}
