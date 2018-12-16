# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="UUID generator/parser in <300 lines"
HOMEPAGE="http://raa.ruby-lang.org/project/ruby-uuid/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


