# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Cells are view components for Rails"
HOMEPAGE="http://cells.rubyforge.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/actionpack-3.0"
ruby_add_rdepend ">=dev-ruby/railties-3.0"
ruby_add_rdepend ">=dev-ruby/uber-0.0.8"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/haml-0"
ruby_add_rdepend ">=dev-ruby/slim-0"
ruby_add_rdepend ">=dev-ruby/tzinfo-0"
ruby_add_rdepend ">=dev-ruby/minitest-4.7.5"
ruby_add_rdepend ">=dev-ruby/activemodel-0"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/sprockets-0"
ruby_add_rdepend ">=dev-ruby/disposable-0.0.6"

