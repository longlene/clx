# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Blazingly fast Entity-Component-System microframework"
HOMEPAGE="https://gitlab.com/lockie/cl-fast-ecs"
SRC_URI="https://gitlab.com/lockie/cl-fast-ecs/-/archive/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/trivial-garbage
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/cl-fast-ecs\/tests/,$d' \
		-i cl-fast-ecs.asd
	rm -rf test.lisp tests
	}
