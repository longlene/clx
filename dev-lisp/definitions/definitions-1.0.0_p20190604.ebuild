# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="15303818d2d78e00bedac1b41851370a7914f41d"

DESCRIPTION="General definitions reflection library"
HOMEPAGE="https://github.com/Shinmera/definitions"
SRC_URI="https://github.com/Shinmera/definitions/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
BDEPEND=""
