# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib

BV=${PV}-1
BV_AMD64=${BV}-linux-x86_64
BV_X86=${BV}-linux-i686

DESCRIPTION="The Crystal Programming Language"
HOMEPAGE="http://crystal-lang.org"
SRC_URI="https://github.com/manastech/crystal/archive/${PV}.tar.gz -> ${P}.tar.gz
amd64? ( https://github.com/manastech/crystal/releases/download/${PV}/crystal-${BV_AMD64}.tar.gz )
x86? ( https://github.com/manastech/crystal/releases/download/${PV}/crystal-${BV_X86}.tar.gz )"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples +xml +yaml zsh-completion"

DEPEND="
	dev-libs/boehm-gc[static-libs]
	dev-libs/libatomic_ops
	dev-libs/libevent
	dev-libs/libpcre
	sys-libs/libunwind
	dev-libs/pcl
	dev-libs/gmp
"
RDEPEND="${DEPEND}
xml? ( dev-libs/libxml2 )
yaml? ( dev-libs/libyaml )
"

src_compile() {
	emake \
		release=1 \
		PATH=${PATH}:${WORKDIR}/${PN}-${BV}/bin \
		CRYSTAL_PATH=src \
		CRYSTAL_CONFIG_VERSION=${PV} \
		CRYSTAL_CONFIG_PATH="libs:/usr/$(get_libdir)/crystal" || die "compile failed"
	if use doc ; then
		emake doc || "compile doc failed"
	fi
}

src_test() {
	emake spec \
		CRYSTAL_PATH=src \
		CRYSTAL_CONFIG_VERSION=${PV} || die "test failed"
}

src_install() {
	insinto /usr/$(get_libdir)/crystal/
	doins -r src/*
	dobin .build/crystal
	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		newins etc/completion.zsh _crystal
	fi
	if use doc ; then
		dodir /usr/share/doc/${PF}/api
		insinto /usr/share/doc/${PF}/api
		doins -r doc/*
	fi

	if use examples ; then
		insinto /usr/share/doc/${PF}
		doins -r samples
	fi
}
