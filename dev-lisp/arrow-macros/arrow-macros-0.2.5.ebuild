# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3

DESCRIPTION="Arrow-macros provides Clojure-like arrow macros in Common Lisp"
HOMEPAGE="https://github.com/hipeta/arrow-macros"
SRC_URI="https://github.com/hipeta/arrow-macros/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-walker
"
