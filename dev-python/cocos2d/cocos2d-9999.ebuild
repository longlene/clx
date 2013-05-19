# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
NEED_PYTHON=2.7

inherit distutils subversion

DESCRIPTION="Framework for building 2D games, demos, and other graphical/interactive applications"
HOMEPAGE="http://www.cocos2d.org/"
ESVN_REPO_URI="http://los-cocos.googlecode.com/svn/trunk"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc examples"

RDEPEND=">=dev-python/pyglet-1.1.2
    virtual/opengl
	( >=dev-lang/python-2.5 ) || ( dev-python/ctypes >=dev-lang/python-2.4 )"

src_install() {
	distutils_src_install
	insinto /usr/share/doc/${PF}
	if use doc; then
		doins -r doc || die
	fi
	if use examples; then
		doins -r samples || die
	fi
}

pkg_postinst() {
	distutils_pkg_postinst
	elog "To execute some effects, you will need a GPU with"
	elog "the GL_EXT_framebuffer_object extension."
	elog "To see if you have this extension, execute:"
	elog "$ glxinfo | grep -i framebuffer"
}
