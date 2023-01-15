# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fd07c43e6bc39fefee7608a41cc4c9286ef81e59"

DESCRIPTION="Tiny library to detect mime types in files"
HOMEPAGE="https://github.com/Shinmera/trivial-mimes"
SRC_URI="https://github.com/Shinmera/trivial-mimes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	common-lisp-install-sources -t all mime-types.lisp mime.types
	common-lisp-install-asdf ${PN}.asd
}
