# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Macros for Ruby"
HOMEPAGE="https://github.com/plexus/macros"

LICENSE="MPL"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">dev-ruby/parser-0"
ruby_add_rdepend ">dev-ruby/unparser-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"

