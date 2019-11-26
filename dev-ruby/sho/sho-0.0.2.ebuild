# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Post-framework Ruby view library"
HOMEPAGE="https://github.com/zverok/sho"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/tilt-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/github-markup-0"
ruby_add_rdepend ">=dev-ruby/yard-junk-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.7.0"
ruby_add_rdepend ">=dev-ruby/rspec-its-0"
ruby_add_rdepend ">=dev-ruby/saharspec-0"
ruby_add_rdepend ">=dev-ruby/fakefs-0"
ruby_add_rdepend ">=dev-ruby/slim-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.57.2"
ruby_add_rdepend ">=dev-ruby/rubocop-rspec-1.27.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rubygems-tasks-0"

