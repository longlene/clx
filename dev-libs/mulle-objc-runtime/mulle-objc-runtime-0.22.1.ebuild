# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A fast, portable Objective-C runtime written 100% in C11"
HOMEPAGE="https://github.com/mulle-objc/mulle-objc-runtime"
SRC_URI="https://github.com/mulle-objc/mulle-objc-runtime/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/mulle-concurrent
	dev-libs/mulle-vararg
	dev-libs/mulle-atinit
	dev-libs/mulle-atexit
	dev-libs/mulle-dlfcn
	dev-libs/mulle-data
"
RDEPEND="${DEPEND}"
BDEPEND=""
