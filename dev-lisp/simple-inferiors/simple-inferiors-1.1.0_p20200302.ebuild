# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="deac886354e03f8a9502ce96f12a0459ce3be671"

DESCRIPTION="A very simple common lisp library to use inferior processes"
HOMEPAGE="https://github.com/Shinmera/simple-inferiors"
SRC_URI="https://github.com/Shinmera/simple-inferiors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/documentation-utils
"
BDEPEND=""
