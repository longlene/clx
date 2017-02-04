# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a6129c586762d54cae7194eed83e5b3114b54f4b"

DESCRIPTION="A library for the Linux GPIO kernel module"
HOMEPAGE="https://github.com/Shinmera/cl-gpio"
SRC_URI="https://github.com/Shinmera/cl-gpio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
