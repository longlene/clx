# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

VIM_PLUGIN_VIM_VERSION="7.3.584"
PYTHON_COMPAT=( python2_5 python2_6 python2_7 )
inherit multilib cmake-utils vim-plugin python-single-r1 git-2

DESCRIPTION="vim plugin: A code-completion engine for Vim"
HOMEPAGE="http://valloric.github.io/YouCompleteMe/"
SRC_URI=""
EGIT_REPO_URI="git://github.com/Valloric/YouCompleteMe.git"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE="+clang"

RDEPEND="|| ( app-editors/vim[python] app-editors/gvim[python] )
${PYTHON_DEPS}
clang? ( ~sys-devel/clang-3.2 )"
DEPEND="${RDEPEND}"

VIM_PLUGIN_HELPTEXT="youcompleteme.txt"

CMAKE_IN_SOURCE_BUILD=1
CMAKE_USE_DIR=${S}/cpp

src_prepare() {
	rm -r .git || die
	mv {README,CONTRIBUTING}.md "${T}"/ || die
}

src_configure() {
	local mycmakeargs=(
	$(cmake-utils_use_use clang CLANG_COMPLETER)
	$(cmake-utils_use_use clang SYSTEM_LIBCLANG)
	)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	dodoc "${T}"/{README,CONTRIBUTING}.md
	rm -rf COPYING.txt {install,style_format}.sh cpp
	vim-plugin_src_install
	python_optimize "${D}"/usr/share/vim/vimfiles/python/completers
	python_fix_shebang "${D}"/usr/share/vim/vimfiles/python/*.py
	use clang && dosym /usr/$(get_libdir)/llvm/libclang.so /usr/share/vim/vimfiles/python/libclang.so
}
