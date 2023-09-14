# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="46193a9a389bb950530e579eae7e6e5a18184832"

DESCRIPTION="Simple, output-agnostic template engine for Common Lisp"
HOMEPAGE="https://github.com/alpha123/cl-template"
SRC_URI="https://github.com/alpha123/cl-template/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsyste #:cl-template-tests/,$d' \
		-i ${PN}.asd
	rm -rf test
}
