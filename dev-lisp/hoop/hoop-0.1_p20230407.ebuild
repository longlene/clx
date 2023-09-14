# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a7df17ff8b15e1a47cfd2cc88484f5ad5db97637"

DESCRIPTION="Common Lisp iteration made more hoopy"
HOMEPAGE="https://github.com/yitzchak/hoop"
SRC_URI="https://github.com/yitzchak/hoop/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem :hoop\/test/,$d' \
		-i ${PN}.asd
	rm -rf code/test
}
