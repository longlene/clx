# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit git-2

DESCRIPTION="modified and patched vim src"
HOMEPAGE="https://github.com/lilydjwg/myvimsrc"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lilydjwg/myvimsrc.git"
EGIT_BRANCH="all"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sys-libs/gpm
dev-lang/perl
dev-lang/ruby
dev-lang/lua
!app-editors/vim
!app-editors/gvim"

src_prepare() {
	# patch for define the place for the global (g)vimrc file (set to /etc/vimrc)
	sed -i 's|^.*\(#define SYS_.*VIMRC_FILE.*"\) .*$|\1|' src/feature.h
	sed -i 's|^.*\(#define VIMRC_FILE.*"\) .*$|\1|'  src/feature.h

}

#--enable-luainterp=dynamic --enable-perlinterp=dynamic \
src_configure() {
	econf --prefix=${D}/usr --localstatedir=/${D}/var/li/vim \
		--mandir=${D}/usr/share/man \
		--disable-gui --without-x --disable-fontset --disable-xsmp \
		--enable-python3interp --enable-rubyinterp=dynamic --enable-pythoninterp \
		--enable-luainterp=dynamic \
		--enable-cscope --enable-multibyte --with-features=huge \
		--with-compiledby=百合仙子 --with-modified-by=百合仙子
}

src_compile() {
	emake || die "compile failed!"
	sed -i 's/compiled_sys.*/compiled_sys = (char_u *)"百合森林";/' src/auto/pathdef.c
	emake || die "compile failed!!"
}

src_install() {
	emake VIMRCLOC=${D}/etc/ DESTDIR=${D} install
}
