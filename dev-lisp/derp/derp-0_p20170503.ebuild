# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a3a11e2c14054d4475658cb9b7b85e5b4f31a529"

DESCRIPTION="Simple Slack Bot"
HOMEPAGE="https://github.com/dptd/derp"
SRC_URI="https://github.com/dptd/derp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/jasaw
	dev-lisp/jasb
	dev-lisp/cl-json
	dev-lisp/cl-ppcre
	dev-lisp/cxml
	dev-lisp/cl-async
	dev-lisp/bordeaux-threads
"
