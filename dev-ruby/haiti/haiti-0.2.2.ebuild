# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Extraction of cucumber helpers for running binaries that I wind up writing ad-hoc for many projects"
HOMEPAGE="https://github.com/JoshCheek/haiti"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cucumber-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"

