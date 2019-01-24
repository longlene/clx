# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="An ES6-compatible class definition for ParenScript"
HOMEPAGE="https://github.com/handicraftsman/water/"
SRC_URI="https://github.com/handicraftsman/water/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parenscript
"
BDEPEND=""
