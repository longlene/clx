# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Cross-platform WebView rendering engine and desktop UI toolkit for Python"
HOMEPAGE="
	https://github.com/deeleeramone/PyWry
	https://deeleeramone.github.io/PyWry/
"
# Versions pinned in pywry/package.json: plotly.js-dist@3.3.1,
# ag-grid-community@35.0.0, lightweight-charts@5.1.0
SRC_URI="
	https://github.com/deeleeramone/PyWry/archive/refs/tags/pywry-${PV}.tar.gz -> ${P}.gh.tar.gz
	https://cdn.jsdelivr.net/npm/plotly.js-dist@3.3.1/plotly.js -> pywry-plotly-3.3.1.js
	https://cdn.jsdelivr.net/npm/ag-grid-community@35.0.0/dist/ag-grid-community.min.js -> pywry-ag-grid-community-35.0.0.min.js
	https://cdn.jsdelivr.net/npm/ag-grid-community@35.0.0/styles/ag-grid.css -> pywry-ag-grid-35.0.0.css
	https://cdn.jsdelivr.net/npm/ag-grid-community@35.0.0/styles/ag-theme-quartz.css -> pywry-ag-theme-quartz-35.0.0.css
	https://cdn.jsdelivr.net/npm/ag-grid-community@35.0.0/styles/ag-theme-alpine.css -> pywry-ag-theme-alpine-35.0.0.css
	https://cdn.jsdelivr.net/npm/ag-grid-community@35.0.0/styles/ag-theme-balham.css -> pywry-ag-theme-balham-35.0.0.css
	https://cdn.jsdelivr.net/npm/ag-grid-community@35.0.0/styles/ag-theme-material.css -> pywry-ag-theme-material-35.0.0.css
	https://cdn.jsdelivr.net/npm/lightweight-charts@5.1.0/dist/lightweight-charts.standalone.production.js -> pywry-lightweight-charts-5.1.0.standalone.production.js
"

S="${WORKDIR}/PyWry-pywry-${PV}/pywry"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/anyio-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.128.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/redis-7.1.0[${PYTHON_USEDEP}]
		dev-python/setproctitle[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.40.0[${PYTHON_USEDEP}]
		>=dev-python/watchdog-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/websockets-16.0[${PYTHON_USEDEP}]
	')
"

python_prepare_all() {
	# Remove pytauri-wheel (pre-built Tauri binaries) from build-system
	# requirements; PYWRY_SKIP_BUNDLE=1 prevents the hook from using it.
	# Also remove the pytauri entry-point that references the non-existent
	# vendored copy; users must install pytauri-wheel separately via pip.
	sed -i \
		's|requires = \["hatchling>=1.21.0", "pip", "pytauri-wheel>=0.8.0"\]|requires = ["hatchling>=1.21.0"]|' \
		pyproject.toml || die
	sed -i '/^\[project.entry-points.pytauri\]$/,/^$/d' pyproject.toml || die

	# Pre-populate frontend assets so the build hook skips CDN downloads.
	# build_assets.py checks for the .gz files before attempting network access.
	local assets_dir="${S}/pywry/frontend/assets"
	mkdir -p "${assets_dir}" || die

	gzip -c -9 "${DISTDIR}/pywry-plotly-3.3.1.js" \
		> "${assets_dir}/plotly-3.3.1.js.gz" || die
	gzip -c -9 "${DISTDIR}/pywry-ag-grid-community-35.0.0.min.js" \
		> "${assets_dir}/ag-grid-community-35.0.0.min.js.gz" || die
	gzip -c -9 "${DISTDIR}/pywry-ag-grid-35.0.0.css" \
		> "${assets_dir}/ag-grid-35.0.0.css.gz" || die
	gzip -c -9 "${DISTDIR}/pywry-lightweight-charts-5.1.0.standalone.production.js" \
		> "${assets_dir}/lightweight-charts-5.1.0.standalone.production.js.gz" || die
	local _theme _mode
	for _theme in quartz alpine balham material; do
		for _mode in light dark; do
			gzip -c -9 "${DISTDIR}/pywry-ag-theme-${_theme}-35.0.0.css" \
				> "${assets_dir}/ag-theme-${_theme}-${_mode}-35.0.0.css.gz" || die
		done
	done

	distutils-r1_python_prepare_all
}

python_compile() {
	PYWRY_SKIP_BUNDLE=1 distutils-r1_python_compile
}

pkg_postinst() {
	elog "PyWry requires the pytauri/pytauri-wheel native Tauri backend for"
	elog "WebView window rendering. This is not yet packaged in Gentoo."
	elog "Install it manually alongside the WebKitGTK system library:"
	elog "  emerge x11-libs/webkit-gtk:4.1"
	elog "  pip install pytauri-wheel"
}
