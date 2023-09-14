# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cedf1d1b12716fbdaa5ae049ac57995031eae33f"

DESCRIPTION="Common Lisp Swagger API client generator"
HOMEPAGE="https://github.com/ibawt/cl-swagger"
SRC_URI="https://github.com/ibawt/cl-swagger/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-json
	dev-lisp/drakma
"
