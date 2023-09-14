# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="25a4f362c2d3255934b656b451319c5c16b9ce67"

DESCRIPTION="Extensible cache services for Common Lisp"
HOMEPAGE="https://github.com/jlahd/cacle/"
SRC_URI="https://github.com/jlahd/cacle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"
