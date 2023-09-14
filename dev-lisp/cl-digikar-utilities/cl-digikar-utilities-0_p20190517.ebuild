# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c1bbdc6685a9b40a851c21b31957c48c23cbbd33"

DESCRIPTION="Yet another utility library for Common Lisp"
HOMEPAGE="https://github.com/digikar99/cl-digikar-utilities/"
SRC_URI="https://github.com/digikar99/cl-digikar-utilities/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
