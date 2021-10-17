# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="88201e861c6cc30bb3b9510d7f55c681eded4085"

DESCRIPTION="a high-level, open-source, general-purpose and system programming language"
HOMEPAGE="http://l-lang.org"
SRC_URI="https://github.com/mlemerre/l-lang/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-util/omake
"
RDEPEND="${DEPEND}"
