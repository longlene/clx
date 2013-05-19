# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# For bugs/comments/suggestion
# Navtej Singh (n.s.buttar@gmail.com)
# JING Cheng (jingcheng01@gmail.com)

inherit versionator

DESCRIPTION="A high quality test automation framework for desktop applications."
HOMEPAGE="http://ldtp.freedesktop.org"

SRC_URI="http://download.freedesktop.org/${PN}/$(get_version_component_range 1).x/$(get_version_component_range 1-2).x/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="java newroles nls python"
DEPEND="dev-lang/python
		>=dev-libs/glib-2.6
	    dev-libs/libxml2
		gnome-base/gail
		gnome-extra/at-spi 
		gnome-extra/libgail-gnome
		"
RDEPEND="${DEPEND}
		java? ( app-accessibility/java-access-bridge )
		python? (
			dev-python/pystatgrab
			dev-python/imaging
		)"
DEPEND="${DEPEND}
		nls? ( sys-devel/gettext )
		"

src_compile()
{
	econf \
        $(use_enable nls localization) \
        $(use_enable newroles) \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install()
{
	emake DESTDIR="${D}" install || die "install failed"
	dodoc AUTHORS NEWS README TODO || die
}
