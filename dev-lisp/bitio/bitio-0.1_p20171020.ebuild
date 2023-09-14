# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b138b755c48e5f1feab63dbb8e25504394ab90d2"

DESCRIPTION="A Common Lisp library for processing octet streams as bit streams"
HOMEPAGE="https://github.com/psilord/bitio"
SRC_URI="https://github.com/psilord/bitio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fast-io
"
