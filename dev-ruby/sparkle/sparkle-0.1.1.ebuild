# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Cache partials and update them asynchronously after a page renders"
HOMEPAGE="http://rubygems.org/gems/sparkle"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"
ruby_add_rdepend "=dev-ruby/rake-0.8.7"
ruby_add_rdepend "=dev-ruby/flexmock-0.8.11"
ruby_add_rdepend "=dev-ruby/activesupport-2.3.11"

