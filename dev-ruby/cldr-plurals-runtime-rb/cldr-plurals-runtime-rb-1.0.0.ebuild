# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

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


