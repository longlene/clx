# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Ruby extension to write Gimp plug-ins and procedures using Ruby-Fu"
HOMEPAGE="http://wiki.slembcke.net/main/published/Gimp-Ruby"
SRC_URI="http://files.slembcke.net/gimp-ruby/gimp-ruby.tgz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86 ~arm"
IUSE=""

DEPEND="
	>=dev-lang/ruby-1.8
	>=media-gfx/gimp-2.3"

src_unpack() {
	unpack ${A}
}

src_compile() { 
	cd gimp-ruby-082106
	./autogen.sh || die
	emake || die
}

src_install() {
	emake install DESTDIR="${D}"
	dodoc ChangeLog INSTALL MAINTAINERS notes.txt README todo.txt
}

