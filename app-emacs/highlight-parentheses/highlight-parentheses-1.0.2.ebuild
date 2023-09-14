# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp eutils

DESCRIPTION="Highlight surrounding parentheses"
HOMEPAGE="https://github.com/nschum/highlight-parentheses.el"
SRC_URI="https://github.com/nschum/highlight-parentheses.el/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/"${PN}.el-${PV}"

src_install() {
	elisp-install ${PN} *.el
}
