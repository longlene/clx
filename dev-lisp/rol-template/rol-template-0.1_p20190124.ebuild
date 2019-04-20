# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="45ec32523412e08bbf3fb1c5b03168cf2a0a7fbb"

DESCRIPTION=""
HOMEPAGE="https://github.com/RailsOnLisp/rol-template"
SRC_URI="https://github.com/RailsOnLisp/rol-template/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-str
"
BDEPEND=""
