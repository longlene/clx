# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1a3e24894e4d7979caf6dc87f7f7f9c2fdffa620"

DESCRIPTION="ZeroMQ Common Lisp bindings"
HOMEPAGE="https://github.com/orivej/pzmq"
SRC_URI="https://github.com/orivej/pzmq/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	net-libs/zeromq
"
