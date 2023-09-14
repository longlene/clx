# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d6085d128e6d6a749afa6cbdedb92ce5aba70526"

DESCRIPTION="Portable CLtL2"
HOMEPAGE="https://github.com/Zulu-Inuoe/trivial-cltl2"
SRC_URI="https://github.com/Zulu-Inuoe/trivial-cltl2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
