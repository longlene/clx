# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="vellum plot"
HOMEPAGE="https://github.com/sirherrbatka/vellum-plot"
SRC_URI="https://github.com/sirherrbatka/vellum-plot/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/serapeum
	dev-lisp/vellum
	dev-lisp/alexandria
	dev-lisp/documentation-utils-extensions
"
BDEPEND=""
