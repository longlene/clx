# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="199846441dad5dfac5478b8dee4b4e20d107af6a"

DESCRIPTION="Percent Encoding (aka URL Encoding) library"
HOMEPAGE="https://github.com/drdo/do-urlencode"
SRC_URI="https://github.com/drdo/do-urlencode/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/babel
"
BDEPEND=""
