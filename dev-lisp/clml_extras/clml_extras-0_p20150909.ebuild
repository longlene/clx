# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="82dfd8871f4ede2ee416c6e868a1d4d1a1dca119"

DESCRIPTION="Extensions to the CLML"
HOMEPAGE="https://github.com/mmaul/clml.extras"
SRC_URI="https://github.com/mmaul/clml.extras/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clml
"
