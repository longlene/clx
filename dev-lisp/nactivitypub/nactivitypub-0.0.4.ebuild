# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="An extensible ActivityPub support library for Common Lisp"
HOMEPAGE="https://github.com/atlas-engineer/nactivitypub"
SRC_URI="https://github.com/atlas-engineer/nactivitypub/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/njson
	dev-lisp/serapeum
	dev-lisp/str
	dev-lisp/local-time
	dev-lisp/lparallel
	dev-lisp/dexador
	dev-lisp/quri
"
BDEPEND=""

