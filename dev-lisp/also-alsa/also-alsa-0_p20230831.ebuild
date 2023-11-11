# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d7e41f5e4533a10e8bc74d36f970f929e001a1e9"

DESCRIPTION="ALSA bindings for Common Lisp"
HOMEPAGE="https://github.com/varjagg/also-alsa/"
SRC_URI="https://github.com/varjagg/also-alsa/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	media-libs/alsa-lib
"
