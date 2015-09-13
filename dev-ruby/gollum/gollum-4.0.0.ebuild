# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A simple, Git-powered wiki with a sweet API and local frontend"
HOMEPAGE="http://github.com/gollum/gollum"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/gollum-lib-4.0"
ruby_add_rdepend ">=dev-ruby/kramdown-1.6.0"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/mustache-0.99.5"
ruby_add_rdepend ">=dev-ruby/useragent-0.10.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.2"
ruby_add_rdepend ">=dev-ruby/shoulda-3.5.0"
ruby_add_rdepend ">=dev-ruby/minitest-reporters-0.14.16"
ruby_add_rdepend ">=dev-ruby/twitter_cldr-2.4.2"
ruby_add_rdepend ">=dev-ruby/mocha-1.0.0"

