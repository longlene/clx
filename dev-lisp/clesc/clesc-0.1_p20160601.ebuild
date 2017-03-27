# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f5dff27f125b1ecc267358ba53e1ef8232ecf97e"

DESCRIPTION="Common Lisp Elastic Search Client"
HOMEPAGE="https://github.com/own-pt/clesc"
SRC_URI="https://github.com/own-pt/clesc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/yason
	dev-lisp/alexandria
"
