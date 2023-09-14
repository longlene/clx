# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="59663b8e286a597fd69ed8dd652bd1dccfa4219b"

DESCRIPTION="Common Lisp bindings to libtorch"
HOMEPAGE="https://github.com/borodust/claw-torch"
SRC_URI="https://github.com/borodust/claw-torch/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/claw
	dev-lisp/trivial-features
"
BDEPEND=""
