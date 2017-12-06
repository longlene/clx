# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a79dfcaadf852a2edf469ddadd7fb2833e4e840d"

DESCRIPTION="A toolset for parsing binary data formats"
HOMEPAGE="https://github.com/mfiano/parsley"
SRC_URI="https://github.com/mfiano/parsley/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fast-io
	dev-lisp/bitio
	dev-lisp/chipz
	dev-lisp/babel
"
