# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="A fast, portable Objective-C runtime written 100% in C11"
HOMEPAGE="https://github.com/mulle-objc/mulle-objc-runtime"
SRC_URI="https://github.com/mulle-objc/mulle-objc-runtime/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/mulle-aba
	dev-libs/mulle-allocator
	dev-libs/mulle-c11
	dev-libs/mulle-concurrent
	dev-libs/mulle-thread
	dev-libs/mulle-vararg
"
RDEPEND="${DEPEND}"
BDEPEND=""
