# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b782b030ae3fb8c7bedbf51553639fe9e67d528e"

DESCRIPTION="SuperCollider-inspired patterns library for Common Lisp"
HOMEPAGE="https://github.com/defaultxr/cl-patterns"
SRC_URI="https://github.com/defaultxr/cl-patterns/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/closer-mop
	dev-lisp/local-time
	dev-lisp/incudine
	dev-lisp/cl-collider
"
