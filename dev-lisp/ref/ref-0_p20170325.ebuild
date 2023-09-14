# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5132d626babbde8844328ec8851681b4c11ebb6b"

DESCRIPTION="An extension of Daniel Barlow's ref setf-expander"
HOMEPAGE="https://github.com/slyrus/ref"
SRC_URI="https://github.com/slyrus/ref/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
