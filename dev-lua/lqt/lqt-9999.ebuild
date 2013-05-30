# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 cmake-utils

DESCRIPTION="Lua bindings for Qt4"
HOMEPAGE="http://code.google.com/p/lqt/ https://github.com/mkottman/lqt"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mkottman/lqt.git"

LICENSE="as"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lang/lua
dev-qt/qtcore"

