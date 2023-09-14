# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="support for constructing vellum tables from the queries to the postgres database"
HOMEPAGE="https://github.com/sirherrbatka/vellum-postmodern"
SRC_URI="https://github.com/sirherrbatka/vellum-postmodern/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/serapeum
	dev-lisp/vellum
	dev-lisp/alexandria
	dev-lisp/postmodern
	dev-lisp/documentation-utils-extensions
"
BDEPEND=""
