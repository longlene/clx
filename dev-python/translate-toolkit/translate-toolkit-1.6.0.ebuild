# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils python

DESCRIPTION="Toolkit to convert between many translation formats"
HOMEPAGE="http://translate.sourceforge.net"
SRC_URI="mirror://sourceforge/translate/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 amd64"
IUSE="doc"

RDEPEND=">=dev-lang/python-2.5
	>=dev-python/pysqlite-2.4.1
	>=dev-python/lxml-1.3.4
	dev-python/utidylib
	dev-python/python-levenshtein
	dev-python/vobject
	app-text/iso-codes"
	# dev-python/iniparse is missing in Portage

PYTHON_MODNAME=translate

src_install() {
	dohtml translate/doc/index.html
	dohtml translate/doc/README
	dohtml translate/doc/user -r
	use doc && dohtml translate/doc/api -r
	#rm translate/doc -Rf

	distutils_src_install

	# ebegin "Moving documentation to the usual location"
	# dohtml translate/doc/* -r
	# previous_doc="/usr/$(get_libdir)/python${PYVER}/site-packages/translate/doc"
	# mv "${D}/${previous_doc}/*" "${D}/usr/doc/${PF}/"
	# rmdir "${D}/${previous_doc}"
	# mv "${D}/usr/doc/${PF}/index.html"  "${D}/usr/doc/${PF}/html/index.html"
	# eend

	ebegin "Creating man pages"
	for file in "${D}"/usr/bin/*; do
		filename=$(basename "$file")
		
		# ini2po and po2ini will crash because we have no iniparse
		[[ "$filename" == "ini2po" ]] && continue
		[[ "$filename" == "po2ini" ]] && continue
		
		# lookupclient.py, pocount, build_tmdb, tmserver and the bash scripts don't have man pages
		[[ "$filename" == "lookupclient.py" ]] && continue
		[[ "$filename" == "pocount" ]] && continue
		[[ "$filename" == "build_tmdb" ]] && continue
		[[ "$filename" == "tmserver" ]] && continue
		file "$file" | grep -F "python" > /dev/null || continue

		PYTHONPATH=${WORKDIR}/${PF}:$PYTHONPATH $file --man > "${T}/$filename.1" || die "$file --man failed."
		doman "${T}/$filename.1"
	done
	eend
}

pkg_postinst() {
	distutils_pkg_postinst
	ewarn "ini2po and po2ini will crash unless \"iniparse\" is installed, but "
	ewarn "there is no \"iniparse\" ebuild in Portage."
}
