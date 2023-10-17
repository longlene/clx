# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c68a88e1fcfb544e395663959bcfb2f894b02429"

DESCRIPTION="Configuration library for Common Lisp"
HOMEPAGE="https://github.com/mmontone/cl-config"
SRC_URI="https://github.com/mmontone/cl-config/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/xml-emitter
	dev-lisp/cl-store
	dev-lisp/cl-cont
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd tests
}
