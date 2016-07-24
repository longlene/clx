# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/dryrb/dry-component"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/inflecto-0.0.2"
ruby_add_rdepend ">=dev-ruby/dry-container-0.3"
ruby_add_rdepend ">=dev-ruby/dry-auto_inject-0.3"
ruby_add_rdepend ">=dev-ruby/dry-configurable-0.1"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"

