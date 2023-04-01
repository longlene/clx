# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Guard::Minitest automatically run your tests with Minitest framework (much like autotest)"
HOMEPAGE="https://rubygems.org/gems/guard-minitest"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/guard-2.0"
ruby_add_rdepend ">=dev-ruby/minitest-3.0"
ruby_add_rdepend ">=dev-ruby/bundler-0"

