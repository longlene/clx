# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake

DESCRIPTION="Woboq CodeBrowser"
HOMEPAGE="http://woboq.com/codebrowser.html"
SRC_URI="https://github.com/woboq/woboq_codebrowser/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="sys-devel/llvm"
RDEPEND="${DEPEND}"

src_install() {
	dobin ${BUILD_DIR}/generator/codebrowser_generator ${BUILD_DIR}/indexgenerator/codebrowser_indexgenerator
	dodoc -r data README.md
}
