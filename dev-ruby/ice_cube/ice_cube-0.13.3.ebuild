# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ice_cube is a recurring date library for Ruby"
HOMEPAGE="http://seejohnrun.github.com/ice_cube/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.12.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0.0"
ruby_add_rdepend ">=dev-ruby/tzinfo-0"
ruby_add_rdepend ">=dev-ruby/i18n-0"

