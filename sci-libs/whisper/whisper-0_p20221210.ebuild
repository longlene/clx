# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="85c9ac18b59125b988cda40f40d8687e1ba88a7a"

DESCRIPTION="Port of OpenAI's Whisper model in C/C++"
HOMEPAGE="https://github.com/ggerganov/whisper.cpp"
SRC_URI="https://github.com/ggerganov/whisper.cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/CFLAGS   =/{s#$# -fPIC#}' \
		-e '/CXXFLAGS =/{s#$# -fPIC#}' \
		-i Makefile
}

src_compile() {
	emake lib${PN}.so
}

src_install() {
	insinto /usr/include
	doins whisper.h
	dolib.so lib${PN}.so
	einstalldocs
}
