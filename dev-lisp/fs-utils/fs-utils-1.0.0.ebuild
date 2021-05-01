# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Utilities for working with files and file paths"
HOMEPAGE="https://github.com/mfiano/fs-utils"
SRC_URI="https://github.com/mfiano/fs-utils/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
