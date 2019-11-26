# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provide a standard and simplified API for communicating with RDBMS from Ruby"
HOMEPAGE="http://github.com/datamapper/do"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-2.1"
ruby_add_rdepend ">=dev-ruby/rspec-2.5"
ruby_add_rdepend ">=dev-ruby/yard-0.5"

