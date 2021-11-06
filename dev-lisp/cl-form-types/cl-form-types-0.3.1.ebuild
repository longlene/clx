# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Library for determining the types of Common Lisp forms"
HOMEPAGE="https://github.com/alex-gutev/cl-form-types"
SRC_URI="https://github.com/alex-gutev/cl-form-types/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-environments
	dev-lisp/agutil
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/optima
	dev-lisp/arrows
	dev-lisp/introspect-environment
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem #:cl-form-types\/test/,$d' ${PN}.asd
}
