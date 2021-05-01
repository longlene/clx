# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9d11be5649ecb5c2b9a2f08a5f2c7e612b061694"

DESCRIPTION="Minimal shoot'em up"
HOMEPAGE="https://github.com/singy15/ministg"
SRC_URI="https://github.com/singy15/ministg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-opengl
	dev-lisp/cl-singleton-mixin
"
