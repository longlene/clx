# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f9c832296fc33dc94603b944d7eec80a72905aae"

DESCRIPTION="Common Lisp utilities"
HOMEPAGE="https://github.com/sjl/cl-losh"
SRC_URI="https://github.com/sjl/cl-losh/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
"
