# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1 optfeature pypi shell-completion

DESCRIPTION="OCRmyPDF adds an OCR text layer to scanned PDF files"
HOMEPAGE="https://github.com/ocrmypdf/OCRmyPDF https://ocrmypdf.readthedocs.io/"

LICENSE="CC-BY-SA-4.0 MIT MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="watcher webservice"
RESTRICT="test"

# dev-python/uharfbuzz (Python HarfBuzz bindings) is not yet packaged;
# needed for PDF text shaping. Package it before installing this.
# dev-python/pi-heif is not yet packaged; upstream marks it optional/non-breaking.

RDEPEND="
	>=app-text/ghostscript-gpl-10.01.2
	>=app-text/pdfminer-20220319[${PYTHON_USEDEP}]
	>=app-text/tesseract-4.1.1[jpeg,tiff,png,webp]
	$(python_gen_cond_dep '
		>=dev-python/deprecation-2.1.0[${PYTHON_USEDEP}]
		>=dev-python/fpdf2-2.8.0[${PYTHON_USEDEP}]
		>=dev-python/packaging-20[${PYTHON_USEDEP}]
		>=dev-python/pikepdf-10[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.0.1[jpeg2k,lcms,${PYTHON_USEDEP}]
		>=dev-python/pluggy-1[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
		>=dev-python/pypdfium2-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13[${PYTHON_USEDEP}]
		watcher? (
			dev-python/cyclopts[${PYTHON_USEDEP}]
			dev-python/python-dotenv[${PYTHON_USEDEP}]
			>=dev-python/watchdog-1.0.2[${PYTHON_USEDEP}]
		)
		webservice? ( dev-python/streamlit[${PYTHON_USEDEP}] )
	')
	>=media-gfx/img2pdf-0.5[${PYTHON_USEDEP}]
"

src_install() {
	distutils-r1_src_install

	newbashcomp misc/completion/ocrmypdf.bash ocrmypdf
	dofishcomp misc/completion/ocrmypdf.fish
}

pkg_postinst() {
	optfeature "image cleaning support" app-text/unpaper
	optfeature "JBIG2 optimization support" media-libs/jbig2enc
	optfeature "PNG optimization support" media-gfx/pngquant
}
