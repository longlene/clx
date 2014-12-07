# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby runtime methods for CLDR plural rules (see camertron/cldr-plurals)"
HOMEPAGE="http://github.com/camertron"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


