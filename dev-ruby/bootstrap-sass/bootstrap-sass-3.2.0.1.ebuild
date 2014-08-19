# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/twbs/bootstrap-sass"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.2"
ruby_add_rdepend ">=dev-ruby/test-unit-2.5.5"
ruby_add_rdepend ">=dev-ruby/capybara-0"
ruby_add_rdepend ">=dev-ruby/poltergeist-0"
ruby_add_rdepend ">=dev-ruby/json-1.8.1"
ruby_add_rdepend ">=dev-ruby/sprockets-rails-2.1.3"
ruby_add_rdepend ">=dev-ruby/autoprefixer-rails-1.1"
ruby_add_rdepend ">=dev-ruby/jquery-rails-3.1.0"
ruby_add_rdepend ">=dev-ruby/slim-rails-0"
ruby_add_rdepend ">=dev-ruby/uglifier-0"
ruby_add_rdepend ">=dev-ruby/compass-0"
ruby_add_rdepend ">=dev-ruby/term-ansicolor-0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
