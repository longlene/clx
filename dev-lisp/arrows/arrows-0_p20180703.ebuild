# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="df7cf0067e0132d9697ac8b1a4f1b9c88d4f5382"

DESCRIPTION="Implements -> and ->> from Clojure"
HOMEPAGE="https://gitlab.com/Harleqin/arrows/"
SRC_URI="https://gitlab.com/Harleqin/arrows/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="CC0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:arrows\/test/,$d' ${PN}.asd
		rm test.lisp
	fi
}
