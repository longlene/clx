# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="788dd45de3135c2d0d1314744ee2180841de112a"

DESCRIPTION="A Common Lisp library to enable simple message pipelines"
HOMEPAGE="https://shinmera.github.io/piping"
SRC_URI="https://github.com/Shinmera/piping/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
