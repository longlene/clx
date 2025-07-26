# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fc4e7e607200356f4e665b9282e4125a3136a2e7"

DESCRIPTION="A collection of utilities to destructure lambda forms"
HOMEPAGE="https://github.com/Shinmera/form-fiddle"
SRC_URI="https://github.com/Shinmera/form-fiddle/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
