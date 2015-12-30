# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC=""
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="2D game development library"
HOMEPAGE="http://www.libgosu.org/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
media-libs/mesa
media-libs/libsdl2
x11-libs/pango
media-libs/libvorbis
media-libs/openal
media-libs/libsndfile
media-libs/sdl2-ttf
media-libs/freeimage
"

all_ruby_prepare() {
	sed -e '111,116 d' \
		-e '118 d' \
		-i ext/gosu/extconf.rb
}


each_ruby_configure() {
	${RUBY} -Cext/gosu extconf.rb
}

each_ruby_compile() {
	emake -Cext/gosu
	cp ext/gosu/gosu.so lib || die
}
