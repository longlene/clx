# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Lisp declarative configuration management system"
HOMEPAGE="https://github.com/spwhitton/consfigurator"
SRC_URI="https://github.com/spwhitton/consfigurator/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/babel-streams
	dev-lisp/cl-ppcre
	dev-lisp/cl-interpol
	dev-lisp/cffi
	dev-lisp/trivial-macroexpand-all
"
BDEPEND=""
