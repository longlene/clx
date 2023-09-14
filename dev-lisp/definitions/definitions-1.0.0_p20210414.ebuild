# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1f4bd7a634a2299aea19cefb5da8041bbb27f2ec"

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
