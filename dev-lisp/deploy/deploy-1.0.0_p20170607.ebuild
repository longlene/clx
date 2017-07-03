# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6e97fef23648273789ec7e7ddacc53f0587c1b81"

DESCRIPTION="Deployment tools for standalone Common Lisp applications"
HOMEPAGE="https://github.com/Shinmera/deploy"
SRC_URI="https://github.com/Shinmera/deploy/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/documentation-utils
	dev-lisp/trivial-features
"
