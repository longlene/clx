# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bb0439c242c7fb11f4def2f8e59c86b5b1b02318"

DESCRIPTION="Easy local binding for Common Lisp"
HOMEPAGE="https://github.com/Edraag/Easy-bind/"
SRC_URI="https://github.com/Edraag/Easy-bind//archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
