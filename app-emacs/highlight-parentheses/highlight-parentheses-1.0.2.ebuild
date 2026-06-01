# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

DESCRIPTION="Highlight surrounding parentheses"
HOMEPAGE="https://github.com/nschum/highlight-parentheses.el"
SRC_URI="https://github.com/nschum/highlight-parentheses.el/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
S="${WORKDIR}"/"${PN}.el-${PV}"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}"

src_install() {
	elisp-install ${PN} *.el
}
