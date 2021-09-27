# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Run CGI scripts from the hunchentoot web server"
HOMEPAGE="https://github.com/slyrus/hunchentoot-cgi"
SRC_URI="https://github.com/slyrus/hunchentoot-cgi/archive/refs/tags/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/puri
"
BDEPEND=""
