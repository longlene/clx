# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Model Context Protocol server for Common Lisp"
HOMEPAGE=""
SRC_URI="https://github.com/cl-ai-project/cl-mcp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/yason
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/eclector
	dev-lisp/hunchentoot
"
BDEPEND=""
