# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6d3ac5a8e2b86b14a99f7fb796b855d442571ef6"

DESCRIPTION="Jakcalope Virtual Machine tools"
HOMEPAGE="https://github.com/t-sin/jackalope"
SRC_URI="https://github.com/t-sin/jackalope/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/babel
	dev-lisp/flexi-streams
"
