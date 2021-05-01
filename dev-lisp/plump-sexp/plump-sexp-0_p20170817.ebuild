# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e5c0d79840590e7f32a28f0477aec7798b6426e3"

DESCRIPTION="Library to turn SEXPs into a Plump-DOM and back"
HOMEPAGE="https://github.com/Shinmera/plump-sexp"
SRC_URI="https://github.com/Shinmera/plump-sexp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/plump
"
