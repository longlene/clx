# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="21f1cfd5942fcaea2ed2e4f6055b2a5a39ac4c6e"

DESCRIPTION="Monitor and restart background threads"
HOMEPAGE="https://github.com/ruricolist/moira"
SRC_URI="https://github.com/ruricolist/moira/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/trivial-features
	dev-lisp/boreaux-threads
	dev-lisp/trivial-garbage
	dev-lisp/osicat
"
BDEPEND=""
