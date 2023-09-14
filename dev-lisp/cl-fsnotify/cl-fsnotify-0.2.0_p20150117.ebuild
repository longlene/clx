# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ac09e941e882450c35538419518e6a91db281035"

DESCRIPTION="File system notifications"
HOMEPAGE="http://howeyc.github.com/cl-fsnotify"
SRC_URI="https://github.com/howeyc/cl-fsnotify/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
