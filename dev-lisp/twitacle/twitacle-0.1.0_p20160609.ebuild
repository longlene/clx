# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b515ea757b2f6def75861617de4a29f2926c294b"

DESCRIPTION="A twitter image bot built with cl-async-oauth and Clarifai APIs"
HOMEPAGE="https://github.com/l04m33/twitacle"
SRC_URI="https://github.com/l04m33/twitacle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-async
	dev-lisp/cl-async-oauth
	dev-lisp/blackbird
"
