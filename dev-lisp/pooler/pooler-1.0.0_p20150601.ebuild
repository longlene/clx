# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d55aaf7d3a8900d7626a2bbdbdd9ea744666e6dc"

DESCRIPTION="A Simple, Thread-Safe Pooling Library for Common Lisp"
HOMEPAGE="http://quasilabs.com/pooler"
SRC_URI="https://github.com/quasi/pooler/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
