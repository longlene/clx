# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A complete web framework for Ruby"
HOMEPAGE="http://lotusrb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/lotus-utils-0.5"
ruby_add_rdepend ">=dev-ruby/lotus-router-0.4"
ruby_add_rdepend ">=dev-ruby/lotus-controller-0.4"
ruby_add_rdepend ">=dev-ruby/lotus-view-0.4"
ruby_add_rdepend ">=dev-ruby/lotus-helpers-0.2"
ruby_add_rdepend ">=dev-ruby/lotus-mailer-0.1"
ruby_add_rdepend ">=dev-ruby/shotgun-0.9"
ruby_add_rdepend ">=dev-ruby/dotenv-2.0"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-10"
ruby_add_rdepend ">=dev-ruby/minitest-5"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"

