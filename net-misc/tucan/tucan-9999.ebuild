# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils subversion

DESCRIPTION="Software designed for automatic management of downloads and uploads at hosting sites like rapidshare or megaupload"
HOMEPAGE="http://tucaneando.com/"
ESVN_REPO_URI="https://forja.rediris.es/svn/cusl3-tucan/trunk"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="gtk"
DEPEND="dev-lang/python
        gtk? ( dev-python/pygtk
               gnome-base/librsvg )
        app-text/tesseract[linguas_en]
        dev-python/imaging"

src_compile() {
        sed -i \
                -e '/^DESTDIR/d' \
                Makefile || die "sed failed"
}

src_install() {
        emake DESTDIR="${D}"/usr install || die "emake install failed"
        dodoc CHANGELOG README || die
        newicon media/tucan.svg "${PN}.svg"
        if use gtk ; then
                make_desktop_entry tucan Tucan
        fi
}
