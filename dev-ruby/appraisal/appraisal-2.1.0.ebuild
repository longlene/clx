# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Appraisal integrates with bundler and rake to test your library against different versions of dependencies"
HOMEPAGE="http://github.com/thoughtbot/appraisal"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/thor-0.14.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.2.21"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"

