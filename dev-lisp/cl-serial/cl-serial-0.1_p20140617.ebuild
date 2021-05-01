# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6c3c1f12ac0a5caff21e0ca5260f47d9e715ed52"

DESCRIPTION="Simple library for work with serial ports"
HOMEPAGE="https://github.com/shamazmazum/cl-serial"
SRC_URI="https://github.com/shamazmazum/cl-serial/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-gray-streams
"
