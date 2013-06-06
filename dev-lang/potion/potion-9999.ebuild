# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2

DESCRIPTION="An object- and mixin-oriented (traits) language"
HOMEPAGE="http://fogus.github.io/potion/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fogus/potion.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	econf
}

src_compile() {
	make
}
