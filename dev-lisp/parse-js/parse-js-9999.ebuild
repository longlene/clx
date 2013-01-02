# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2 common-lisp-3

DESCRIPTION="A JavaScript parser in Common Lisp"
HOMEPAGE="http://marijnhaverbeke.nl/parse-js/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/marijnh/parse-js.git"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-3_src_install

	local dest=/usr/share/doc/${PF}/html
	insinto ${dest}
	doins as.txt
	exeinto ${dest}

	dohtml index.html as.txt
}

