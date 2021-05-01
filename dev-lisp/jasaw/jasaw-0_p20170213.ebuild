# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="268cbad9393cfd9aca3d816509d48319b5ec4fc2"

DESCRIPTION="Just Another Slack API Wrapper"
HOMEPAGE="https://github.com/dptd/jasaw"
SRC_URI="https://github.com/dptd/jasaw/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/dexador
	dev-lisp/cl-json
"
