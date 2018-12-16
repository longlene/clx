# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Hunspell is an easy native Ruby interface to the famous Hunspell spell checker
library which is part of OpenOffice and Mozilla products"
HOMEPAGE="https://github.com/segabor/Hunspell"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""


