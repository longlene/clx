# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A library of assertions written in Common Lisp"
HOMEPAGE="https://github.com/noloop/assert-p"
SRC_URI="https://github.com/noloop/assert-p/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/assertion-error
"
BDEPEND=""
