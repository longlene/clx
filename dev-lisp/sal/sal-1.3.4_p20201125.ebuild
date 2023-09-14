# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bad6c373586bfddaaf9c4b7f3c061cb86c910b6b"

DESCRIPTION="S-Expression based object serializer for common lisp"
HOMEPAGE="https://github.com/hyotang666/sal"
SRC_URI="https://github.com/hyotang666/sal/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/millet
	dev-lisp/closer-mop
	dev-lisp/structure-ext
	dev-lisp/prompt-for
"
BDEPEND=""
