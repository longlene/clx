# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f5b8ff736a39c70d896bd996e8e7cfe243c4c5a7"

DESCRIPTION="Simple TEst Framework In Lisp"
HOMEPAGE="https://common-lisp.net/project/stefil/index-old.shtml"
SRC_URI="https://github.com/longlene/stefil/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
