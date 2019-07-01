# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic vcs-snapshot

DESCRIPTION="The V Programming Language"
HOMEPAGE="https://vlang.io/"
SRC_URI="
	https://github.com/vlang/v/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/vlang/vc/archive/cbb870a8ae09ad099e40da0dc5848a4484d77d4b.tar.gz -> v.c-${PV}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/glfw
	net-misc/curl
	media-libs/freetype
"
BDEPEND=""

src_prepare() {
	default
	cp ${WORKDIR}/v.c-${PV}/v.c compiler/v.c
	local vdir=${S}/compiler
	sed -i "s|os__home_dir(), tos2(\"/code/v/\")|tos2(\"${vdir}\"), tos2(\"\")|g" compiler/v.c
	sed -i 's/!os.dir_exists(lang_dir)/false/g' compiler/main.v
	cp compiler/main.v{,.b}
	sed -i "s|mut lang_dir = os.home_dir() + '/code/v/'|mut lang_dir = '${vdir}'|g"  compiler/main.v
	sed -i "s|mut lang_dir = os.home_dir() + '/code/v/'|mut lang_dir = '/usr/lib/v'|g" compiler/main.v.b
}

src_compile() {
	$(tc-getCC) -w -o compiler/vc compiler/v.c
	cd compiler && ./vc -o v . && mv main.v.b main.v && ./v -o v .
}

src_install() {
	dobin compiler/v
	insinto /usr/$(get_libdir)/v
	doins -r base64 builtin gl glfw glm gx http json log math os rand stbi sync termcolor tests thirdparty time
	dodoc -r examples README.md
}
