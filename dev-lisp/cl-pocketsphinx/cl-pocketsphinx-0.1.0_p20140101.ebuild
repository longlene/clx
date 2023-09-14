# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="aa2f86ddac12728916a002676bf7bd3d5ecf9640"

DESCRIPTION="Common Lisp bindings to the CMUSphinx speech recognition project"
HOMEPAGE="https://github.com/Fizzixnerd/cl-sphinx"
SRC_URI="https://github.com/Fizzixnerd/cl-sphinx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/alexandria
	dev-lisp/trivial-garbage
	dev-lisp/cl-ppcre
	app-accessibility/pocketsphinx
"
