# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d2e6a9a60c60dde5493f57e77590c292194fa37a"

DESCRIPTION="Retrieve machine state information"
HOMEPAGE="https://github.com/Shinmera/machine-state"
SRC_URI="https://github.com/Shinmera/machine-state/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/cffi
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-features
"
BDEPEND=""
