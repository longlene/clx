# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="092430d95f1ea99af2762ae98faa09c225cc3785"

DESCRIPTION="An extensible and highly modular bot framework"
HOMEPAGE="https://github.com/Shirakumo/maiden"
SRC_URI="https://github.com/Shirakumo/maiden/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/deeds
	dev-lisp/verbose
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	dev-lisp/closer-mop
	dev-lisp/uuid
	dev-lisp/form-fiddle
	dev-lisp/lambda-fiddle
	dev-lisp/documentation-utils
	dev-lisp/trivial-indent
"