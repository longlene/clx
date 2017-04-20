# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="56fb0c8760159988d33a0a58f67e7fd00da16e87"

DESCRIPTION="A library for the Linux GPIO kernel module"
HOMEPAGE="https://github.com/Shinmera/cl-gpio"
SRC_URI="https://github.com/Shinmera/cl-gpio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
