# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="SHOP3"
HOMEPAGE="https://shop-planner.github.io/"
SRC_URI="https://github.com/shop-planner/shop3/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-garbage
	dev-lisp/alexandria
	dev-lisp/iterate
"
BDEPEND=""

src_install() {
	default
	common-lisp-install-sources -t all shop3/shop-version.lisp-expr
}
