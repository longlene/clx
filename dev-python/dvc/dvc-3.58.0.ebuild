# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Data Versioning and ML Experiments"
HOMEPAGE="
	https://dvc.org/
	https://github.com/iterative/dvc
	https://pypi.org/project/dvc/
"
SRC_URI="https://github.com/iterative/dvc/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/attrs-22.2.0[${PYTHON_USEDEP}]
	dev-python/celery[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.3.9[${PYTHON_USEDEP}]
	>=dev-python/configobj-5.0.9[${PYTHON_USEDEP}]
	>=dev-python/distro-1.3[${PYTHON_USEDEP}]
	>=dev-python/dpath-2.1.0[${PYTHON_USEDEP}]
	dev-python/dulwich[${PYTHON_USEDEP}]
	>=dev-python/dvc-data-3.16.2[${PYTHON_USEDEP}]
	>=dev-python/dvc-http-2.29.0[${PYTHON_USEDEP}]
	dev-python/dvc-objects[${PYTHON_USEDEP}]
	>=dev-python/dvc-render-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/dvc-studio-client-0.21[${PYTHON_USEDEP}]
	>=dev-python/dvc-task-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/flatten_dict-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/flufl-lock-8.1.0[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2024.2.0[${PYTHON_USEDEP}]
	>=dev-python/funcy-1.14[${PYTHON_USEDEP}]
	>=dev-python/grandalf-0.7[${PYTHON_USEDEP}]
	>=dev-python/gto-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/hydra-core-1.1[${PYTHON_USEDEP}]
	>=dev-python/iterative-telemetry-0.0.7[${PYTHON_USEDEP}]
	dev-python/kombu[${PYTHON_USEDEP}]
	>=dev-python/networkx-2.5[${PYTHON_USEDEP}]
	dev-python/omegaconf[${PYTHON_USEDEP}]
	>=dev-python/packaging-19[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.10.3[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/psutil-5.8[${PYTHON_USEDEP}]
	>=dev-python/pydot-1.2.4[${PYTHON_USEDEP}]
	>=dev-python/pygtrie-2.3.2[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.4.7[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22[${PYTHON_USEDEP}]
	>=dev-python/rich-12[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.17.11[${PYTHON_USEDEP}]
	>=dev-python/scmrepo-3.3.8[${PYTHON_USEDEP}]
	>=dev-python/shortuuid-0.5[${PYTHON_USEDEP}]
	>=dev-python/shtab-1.3.4[${PYTHON_USEDEP}]
	>=dev-python/tabulate-0.8.7[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.11.1[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.63.1[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.11.7[${PYTHON_USEDEP}]
	>=dev-python/zc-lockfile-1.2.1[${PYTHON_USEDEP}]
"
RESTRICT="test"
