# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Capybara driver for headless WebKit to test JavaScript web apps"
HOMEPAGE="http://github.com/thoughtbot/capybara-webkit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/capybara-0.2"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14.0"
ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/mini_magick-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/appraisal-0.4.0"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-0"
ruby_add_rdepend ">=dev-ruby/launchy-0"

all_ruby_prepare() {
	sed -i '/git ls-files/d' ${PN}.gemspec
}
